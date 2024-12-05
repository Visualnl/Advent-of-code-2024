$input = Get-Content "day-5-input.txt"

$splitInput = $input.IndexOf('')
$regels = $input[0..($splitInput - 1)]
$updates = $input[($splitInput + 1)..$input.Length]


$regelsGesplitst = $regels | ForEach-Object {
    $splitsingOp = $_ -split '\|'
    [PSCustomObject]@{
        eersteGetal = [int]$splitsingOp[0]
        tweedeGetal = [int]$splitsingOp[1]
    }
}

$somMidden = 0
$verkeerdeUpdates = @()
$somMiddenGecorrigeerd = 0


foreach ($update in $updates) {
    $updateArray = $update -split ',' | ForEach-Object { [int]$_ }
    $correct = $true 

    foreach ($regel in $regelsGesplitst) {
        $eerste = $regel.eersteGetal
        $tweede = $regel.tweedeGetal
       
        if ($updateArray -contains $eerste -and $updateArray -contains $tweede) {
            $eersteIndex = $updateArray.IndexOf($eerste)
            $tweedeIndex = $updateArray.IndexOf($tweede)

            if ($eersteIndex -gt $tweedeIndex) {
                $correct = $false
                $verkeerdeUpdates += ,@($updateArray)
                break
            }
        }
    }

    if ($correct) {
       
        $midden = [math]::Floor($updateArray.Length / 2)
        $middenGetal = $updateArray[$midden]
        $somMidden += $middenGetal
        
    } else {
       
        $tempUpdateArray = $updateArray

        $correct = $false
        while (!$correct) {
            $correct = $true
            foreach ($regel in $regelsGesplitst) {
                $eerste = $regel.eersteGetal
                $tweede = $regel.tweedeGetal
               
                if ($tempUpdateArray -contains $eerste -and $tempUpdateArray -contains $tweede) {
                    $eersteIndex = $tempUpdateArray.IndexOf($eerste)
                    $tweedeIndex = $tempUpdateArray.IndexOf($tweede)

                    if ($eersteIndex -gt $tweedeIndex) {
                        
                        $tempUpdateArray[$eersteIndex], $tempUpdateArray[$tweedeIndex] = $tempUpdateArray[$tweedeIndex], $tempUpdateArray[$eersteIndex]
                        $correct = $false  
                    }
                }
            }
        }

      
        $middenGecorrigeerd = [math]::Floor($tempUpdateArray.Length / 2)
        $middenGetalGecorrigeerd = $tempUpdateArray[$middenGecorrigeerd]
        $somMiddenGecorrigeerd += $middenGetalGecorrigeerd
         
    }
}


Write-Host "Som van de middenpagina's voor correcte updates: $somMidden"
Write-Host "Som van de middenpagina's voor gecorrigeerde updates: $somMiddenGecorrigeerd"
