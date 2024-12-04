$matrix = Get-Content -path "day-4-input.txt"
$opgeteld1 = 0
$opgeteld2 = 0


for($r = 0; $r -lt $matrix.Length; $r++) {
    $rij = $matrix[$r]
    for($w = 0; $w -lt $rij.Length - 3; $w++) {
        if ($rij.Substring($w, 4) -eq 'XMAS' -or $rij.Substring($w, 4) -eq 'SAMX') {
            $opgeteld1++
        }
    }
}


for($r = 0; $r -lt $matrix.Length - 3; $r++) {
    for($w = 0; $w -lt $matrix[$r].Length; $w++) {
        if ($matrix[$r][$w] -eq 'X' -and $matrix[$r+1][$w] -eq 'M' -and $matrix[$r+2][$w] -eq 'A' -and $matrix[$r+3][$w] -eq 'S') {
            $opgeteld1++
        }
        if ($matrix[$r][$w] -eq 'S' -and $matrix[$r+1][$w] -eq 'A' -and $matrix[$r+2][$w] -eq 'M' -and $matrix[$r+3][$w] -eq 'X') {
            $opgeteld1++
        }
    }
}


for($r = 0; $r -lt $matrix.Length - 3; $r++) {
    for($w = 0; $w -lt $matrix[$r].Length - 3; $w++) {
        if ($matrix[$r][$w] -eq 'X' -and $matrix[$r+1][$w+1] -eq 'M' -and $matrix[$r+2][$w+2] -eq 'A' -and $matrix[$r+3][$w+3] -eq 'S') {
            $opgeteld1++
        }
        if ($matrix[$r][$w] -eq 'S' -and $matrix[$r+1][$w+1] -eq 'A' -and $matrix[$r+2][$w+2] -eq 'M' -and $matrix[$r+3][$w+3] -eq 'X') {
            $opgeteld1++
        }
    }
}


for($r = 3; $r -lt $matrix.Length; $r++) {
    for($w = 0; $w -lt $matrix[$r].Length - 3; $w++) {
        if ($matrix[$r][$w] -eq 'X' -and $matrix[$r-1][$w+1] -eq 'M' -and $matrix[$r-2][$w+2] -eq 'A' -and $matrix[$r-3][$w+3] -eq 'S') {
            $opgeteld1++
        }
        if ($matrix[$r][$w] -eq 'S' -and $matrix[$r-1][$w+1] -eq 'A' -and $matrix[$r-2][$w+2] -eq 'M' -and $matrix[$r-3][$w+3] -eq 'X') {
            $opgeteld1++
        }
    }
}

for ($r = 1; $r -lt $matrix.Length - 1; $r++) {
    for ($c = 1; $c -lt $matrix[$r].Length - 1; $c++) {
        
        if ($matrix[$r][$c] -eq 'A') {
            
            if ($r - 1 -ge 0 -and $r + 1 -lt $matrix.Length) {
                $boven = $matrix[$r-1][$c-1] + $matrix[$r-1][$c+1]
                $onder= $matrix[$r+1][$c-1] + $matrix[$r+1][$c+1]

                if (($boven-eq "MS" -and $onder -eq "MS") -or
                    ($boven -eq "SM" -and $onder -eq "SM") -or
                    ($boven-eq "SS" -and $onder -eq "MM") -or
                    ($boven -eq "MM" -and $onder -eq "SS")) {
                    $opgeteld2++
                }
            }
        }
    }
}



Write-Host $opgeteld1
Write-Host $opgeteld2






