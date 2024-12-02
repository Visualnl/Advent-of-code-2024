#part 1 van dag 2
function Test-Increasing {
    param (
       [int[]]$array 
    )
    for($i = 1 ; $i -lt $array.length; $i++) {
        if($array[$i] -le $array[$i - 1]) {
           return $false
        }
    }
    return $true
}

function Test-Decreasing {
    param (
       [int[]]$array 
    )
    for($i = 1 ; $i -lt $array.length; $i++) {
        if($array[$i] -ge $array[$i - 1]) {
           return $false
        }
    }
    return $true
}

function Test-Verschil {
    param(
        [int[]]$array
    )
    for($i = 0 ; $i -lt $array.length - 1; $i++) {
        $verschil =  $array[$i] - $array[$i + 1] 
        if($verschil -notin -1,-2,-3,1,2,3) {
           return $false
        }
    }
    return $true

}


$array = Get-Content -path "day-2-input.txt"
$levels = @{}
$index = 1

foreach($level in $array) {
    $levels[$index] = $level.Split(' ') | ForEach-Object { [int]$_ }
    $index++
}


$safe = 0



for ($i = 1; $i -le $levels.Keys.Count; $i++) {
  
    $level = $levels[$i]
 
    $isIncreasing = Test-Increasing-Increasing -array $level

    $isDecreasing = Test-DecreasingDecreasing -array $level

    $isValidDifference = Test-Verschil-array $level

    if (($isIncreasing -or $isDecreasing) -and $isValidDifference) {
        $safe += 1
    }
}


Write-Host $safe

#part 2 van day2
