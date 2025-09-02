#!/bin/bash

# Stop Local Supabase for Archon
# This script stops the local Supabase instance

set -e

echo "🛑 Stopping Local Supabase for Archon..."

# Stop the services
echo "🐳 Stopping Supabase services..."
docker-compose -f docker-compose.supabase-local.yml down

echo "✅ Local Supabase services stopped!"

# Optionally remove volumes (uncomment if you want to reset data)
# echo "🗑️  Removing volumes..."
# docker-compose -f docker-compose.supabase-local.yml down -v

echo "📝 To start the services again, run: ./start-supabase-local.sh"
