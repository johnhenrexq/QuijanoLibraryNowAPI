# Base runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 8080
ENV ASPNETCORE_URLS=http://+:8080

# Build image (use SDK, not aspnet)
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy everything
COPY . .

# Restore dependencies
RUN dotnet restore "QuijanoLibraryNowAPI/QuijanoLibraryNowAPI.csproj"

# Publish app
RUN dotnet publish "QuijanoLibraryNowAPI/QuijanoLibraryNowAPI.csproj" -c Release -o /app/out

# Final runtime image
FROM base AS final
WORKDIR /app
COPY --from=build /app/out .

ENTRYPOINT ["dotnet", "QuijanoLibraryNowAPI.dll"]
