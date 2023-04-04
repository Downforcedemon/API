# Set the name of the remote computer to check
$computerName = "COMPUTER_NAME"

#Set the length of time to retrieve Cpu utili
$sampleTime = 10

#Construct the counter path for the cpu utilization counter
$counterPath = "////$computerName/Processor(_total)\% Processor Time"

#Retrieve the cpu utilizatoin data aftor specified time
$cpuUtilizationData = Get-Counter -Counter $CounterPath -SampleInterval 1 -MaxSamples $sampleTime

#Calculate the average Cpu utilizaton %
cpuUtilization = (($cpuUtilizationData.CounterSamples.CookedValue | Measure-Object -Average ).Average)

#Output the Cpu utilizaton percentage
Write-Host "{$computerName}:  {$cpuUtilization}%"