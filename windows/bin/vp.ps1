param(
		[string]$file,
		[Parameter(ValueFromRemainingArguments = $true)] $args
	 )

	$line = $null
	for ($i = 0; $i -lt $args.Count; $i++) {
		if ($args[$i] -eq '-g' -and $i + 1 -lt $args.Count) {
			$line = [int]$args[$i + 1]
				break
		}
	}

if ($file) {
	try {
		$absFile = (Resolve-Path $file -ErrorAction Stop).Path
	} catch {
		$absFile = (Join-Path (Get-Location).Path $file)
	}
}

if ($file) {
	$fileDir = Split-Path -Path $file -Parent
} else {
	$fileDir = (Get-Location).Path
}

Push-Location $fileDir
try {
	$root = (& git rev-parse --show-toplevel) 2>$null

		if (-not $root -or $root -eq "") {
			$root = (Get-Location).Path
		}
}
finally {
	Pop-Location
}

$project = (Split-Path $root -Leaf) -replace '[^\w\-]', '_'
$pipe = "\\.\pipe\nvim-$project"

function Invoke-NvimCommand($cmd) {
	& "C:\Program Files\Neovim\bin\nvim.exe" --server $pipe --remote-expr "execute('$cmd')"
}

Push-Location $root
try {
	if ($absFile) {
		if (Test-Path $absFile) {
			$relative = Resolve-Path -Relative $absFile 2>$null
				if (-not $relative) { $relative = $absFile }
			$escaped = $relative -replace '\\', '/'
		} else {
			$escaped = $absFile -replace '\\', '/'
		}
	}
}
finally {
	Pop-Location
}

# Write-Host "=== vp debug ==="
# Write-Host "cwd: $(Get-Location)"
# Write-Host "root: $root"
# Write-Host "file: $absFile"
# Write-Host "pipe: $pipe"
# Write-Host "line: $line"

Push-Location $root
try {
	if ($absFile) {
		$relative = Resolve-Path -Relative $absFile 2>$null
			if (-not $relative) { $relative = $absFile }
		$escaped = $relative -replace '\\', '/'
	}

	if (Test-Path $pipe) {
		if ($absFile) {
			if ($line) {
				Invoke-NvimCommand "tcd $root | keepalt edit $escaped | $line"
			} else {
				Invoke-NvimCommand "tcd $root | keepalt edit $escaped"
			}
		} else {
			Invoke-NvimCommand "tcd $root"
		}
	}
	else {
		Push-Location $root
			try {
				$psCmd = if (Get-Command pwsh -ErrorAction SilentlyContinue) { "pwsh.exe" } else { "powershell.exe" }
				if ($absFile) {
					if ($line) {
						$innerCmd = "Set-Location `"$root`"; nvim --listen `"$pipe`" +$line `"$absFile`""
					} else {
						$innerCmd = "Set-Location `"$root`"; nvim --listen `"$pipe`" `"$absFile`""
					}
				} else {
					$innerCmd = "Set-Location `"$root`"; nvim --listen `"$pipe`""
				}
				Start-Process $psCmd -ArgumentList "-NoExit", "-NoLogo", "-Command", $innerCmd
			}
		finally {
			Pop-Location
		}
	}
}
finally {
	Pop-Location
}



