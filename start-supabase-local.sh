#!/bin/bash

# Start Local Supabase for Archon
# This script starts the local Supabase instance using Docker Compose

set -e

echo "🚀 Starting Local Supabase for Archon..."

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker is not running. Please start Docker and try again."
    exit 1
fi

# Start the services
echo "🐳 Starting Supabase services..."
docker-compose -f docker-compose.supabase-local.yml up -d

# Wait for services to be ready
echo "⏳ Waiting for services to be ready..."
sleep 15

# Check service status
echo "🔍 Checking service status..."
docker-compose -f docker-compose.supabase-local.yml ps

echo ""
echo "✅ Local Supabase is starting up!"
echo ""
echo "📊 Service URLs:"
echo "   • Supabase Studio (Dashboard): http://localhost:6302"
echo "   • REST API: http://localhost:6301"
echo "   • Auth API: http://localhost:6999"
echo "   • Realtime: http://localhost:6400"
echo "   • Storage: http://localhost:6500"
echo "   • Database: localhost:6543"
echo "   • Email Testing: http://localhost:6825"
echo ""
echo "🔑 Supabase Keys:"
echo "   • Anon Key: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0"
echo "   • Service Key: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImV4cCI6MTk4MzgxMjk5Nn0.EGIM96RAZx35lJzdJsyH-qQwv8Hdp7fsn3W0YpN81IU"
echo ""
echo "📝 Next steps:"
echo "   1. Update your .env file with:"
echo "      SUPABASE_URL=http://localhost:6301"
echo "      SUPABASE_SERVICE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImV4cCI6MTk4MzgxMjk5Nn0.EGIM96RAZx35lJzdJsyH-qQwv8Hdp7fsn3W0YpN81IU"
echo "   2. Run the database migration in Supabase Studio"
echo "   3. Start Archon with: docker compose up --build -d"
echo ""
echo "📝 To stop the services, run: ./stop-supabase-local.sh"
echo "📝 To view logs, run: docker-compose -f docker-compose.supabase-local.yml logs -f"
