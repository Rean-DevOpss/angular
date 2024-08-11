# Extract name and version from package.json
$jsonContent = Get-Content -Raw -Path "package.json" | ConvertFrom-Json
$PROJECT_NAME = $jsonContent.name
$PROJECT_VERSION = $jsonContent.version

# Build the Docker image with the extracted values
docker build --build-arg PROJECT_NAME=$PROJECT_NAME -t "${PROJECT_NAME}:1" -f nginx.dockerfile .
