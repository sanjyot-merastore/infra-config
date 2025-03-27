# Define variables
$serverName = "localhost,1433"  # Change to your SQL Server container's IP and port if needed
$databaseName = "master"  # The database you want to execute the script against
$saPassword = "@8038X£_9n>Ehq=FN"  # The SA password set in the Docker container
$sqlFilePath = ".\delete-users.sql"  # Path to your init.sql file

# Check if sqlcmd is installed
if (-not (Get-Command sqlcmd -ErrorAction SilentlyContinue)) {
    Write-Error "sqlcmd utility is not installed. Please install SQL Server Command-Line Tools."
    exit 1
}

# Execute the SQL script
try {
    sqlcmd -S $serverName -d $databaseName -U sa -P $saPassword -i $sqlFilePath
    Write-Output "SQL script executed successfully."
} catch {
    Write-Error "Error executing SQL script: $_"
}
