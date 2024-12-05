# Stap 1: Lees de inhoud van het bestand
$input = Get-Content "day-5-input.txt"


$splitInput= $input.indexOf('')
$regels = $input[0..$splitInput]
$updates = $input[($splitInput+1)..$input.Length]


$regelsGesplitst = $regels | ForEach-Object {
    $splitsingOp = $_ -split '\|'
    [PSCustomObject]@{
        eersteGetal = [int]$splitsingOp[0]
        tweedeGetal = [int]$splitsingOp[1]
    }
}

$somMidden = 0

foreach ($update in $updates) {
    $updateArray = $update -split ',' | ForEach-Object {
        [int] $_
    }
    $correct = $true 
    foreach($regel in $regelsGesplitst) {
        $eerste = $regel.eersteGetal
        $tweede =$regel.tweedeGetal
       
        if($updateArray -contains $eerste -and $updateArray -contains $tweede){
            $eersteIndex = $updateArray.indexOf($eerste)
            $tweedeIndex = $updateArray.indexOf($tweede)

            if($eersteIndex -gt $tweedeIndex) {
                $correct = $false
                break
            }
        }
    }
    if($correct) {
       $midden = [math]::Floor($updateArray.Length / 2)
       $middenGetal = $updateArray[$midden]
       $somMidden += $middenGetal
    }

}



Write-Host $somMidden
