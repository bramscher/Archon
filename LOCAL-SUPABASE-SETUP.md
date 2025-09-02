# Local Supabase Setup for Archon

This guide helps you set up a local Supabase instance for Archon that won't conflict with your other projects.

## 🚀 Quick Start

1. **Start Local Supabase:**
   ```bash
   ./start-supabase-local.sh
   ```

2. **Update your .env file:**
   ```bash
   # Edit your .env file and add:
   SUPABASE_URL=http://localhost:6301
   SUPABASE_SERVICE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImV4cCI6MTk4MzgxMjk5Nn0.EGIM96RAZx35lJzdJsyH-qQwv8Hdp7fsn3W0YpN81IU
   ```

3. **Set up the database:**
   - Open http://localhost:6302 (Supabase Studio)
   - Go to SQL Editor
   - Copy and paste the contents of `migration/complete_setup.sql`
   - Execute the script

4. **Start Archon:**
   ```bash
   docker compose up --build -d
   ```

5. **Stop Local Supabase:**
   ```bash
   ./stop-supabase-local.sh
   ```

## 📊 Service Ports

The local Supabase instance runs on these ports (chosen to avoid conflicts):

| Service | Port | URL | Description |
|---------|------|-----|-------------|
| **Database** | 6543 | `localhost:6543` | PostgreSQL database |
| **REST API** | 6301 | `http://localhost:6301` | PostgREST API |
| **Auth API** | 6999 | `http://localhost:6999` | GoTrue authentication |
| **Realtime** | 6400 | `http://localhost:6400` | Realtime subscriptions |
| **Storage** | 6500 | `http://localhost:6500` | File storage API |
| **Studio** | 6302 | `http://localhost:6302` | Supabase dashboard |
| **Meta** | 6808 | `http://localhost:6808` | Database introspection |
| **Email Testing** | 6825 | `http://localhost:6825` | Mailpit email testing |

## 🔑 API Keys

For local development, use these pre-configured keys:

- **Anon Key:** `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0`
- **Service Key:** `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImV4cCI6MTk4MzgxMjk5Nn0.EGIM96RAZx35lJzdJsyH-qQwv8Hdp7fsn3W0YpN81IU`

## 🛠️ Configuration

### Environment Variables

Update your `.env` file with these values:

```bash
# Supabase Configuration
SUPABASE_URL=http://localhost:6301
SUPABASE_SERVICE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImV4cCI6MTk4MzgxMjk5Nn0.EGIM96RAZx35lJzdJsyH-qQwv8Hdp7fsn3W0YpN81IU

# Database URL (for direct database access)
DATABASE_URL=postgresql://postgres:postgres@localhost:6543/postgres
```

### Database Setup

1. **Access Supabase Studio:**
   - Open http://localhost:6302
   - Use the default credentials (no login required for local setup)

2. **Run the migration:**
   - Go to SQL Editor
   - Copy the contents of `migration/complete_setup.sql`
   - Paste and execute

3. **Verify setup:**
   - Check the Tables section to see Archon tables
   - Verify the Settings table has initial configuration

## 📁 Files Created

- `docker-compose.supabase-local.yml` - Docker Compose configuration
- `supabase/init/01-init.sql` - Database initialization script
- `start-supabase-local.sh` - Startup script
- `stop-supabase-local.sh` - Shutdown script
- `LOCAL-SUPABASE-SETUP.md` - This guide

## 🔧 Integration with Archon

After setting up the local Supabase:

1. **Start Archon services:**
   ```bash
   docker compose up --build -d
   ```

2. **Access Archon UI:**
   - Open http://localhost:3737
   - Go to Settings
   - Configure your API keys (OpenAI, etc.)

3. **Test the setup:**
   - Try uploading a document
   - Test web crawling
   - Create a project

## 🐛 Troubleshooting

### Check Service Status
```bash
docker-compose -f docker-compose.supabase-local.yml ps
```

### View Logs
```bash
# All services
docker-compose -f docker-compose.supabase-local.yml logs -f

# Specific service
docker-compose -f docker-compose.supabase-local.yml logs -f supabase-db
```

### Reset Database
```bash
# Stop services and remove volumes
docker-compose -f docker-compose.supabase-local.yml down -v

# Start again
./start-supabase-local.sh
```

### Port Conflicts
If you encounter port conflicts, modify the ports in `docker-compose.supabase-local.yml` and update the corresponding URLs in your `.env` file.

## 📚 Useful Commands

### Database Access
```bash
# Connect to database
psql postgresql://postgres:postgres@localhost:6543/postgres

# Or using Docker
docker exec -it archon-supabase-db psql -U postgres -d postgres
```

### Supabase Studio
Access the dashboard at http://localhost:6302 to:
- Browse and edit data
- Manage authentication
- Test API endpoints
- Monitor realtime subscriptions

### Email Testing
Access Mailpit at http://localhost:6825 to view emails sent by the auth system.

## 🔒 Security Notes

- This is a **development-only** setup
- JWT secrets are hardcoded for convenience
- No SSL/TLS encryption
- Database is accessible without authentication from the host
- **Do not use these settings in production**

## 🚀 Complete Setup Flow

1. **Start local Supabase:**
   ```bash
   ./start-supabase-local.sh
   ```

2. **Update .env file** with the local Supabase URLs

3. **Set up database schema:**
   - Open http://localhost:6302
   - Run `migration/complete_setup.sql`

4. **Start Archon:**
   ```bash
   docker compose up --build -d
   ```

5. **Configure Archon:**
   - Open http://localhost:3737
   - Set up API keys in Settings

6. **Test everything:**
   - Upload a document
   - Crawl a website
   - Create a project

## 🔄 Differences from Cloud Supabase

This local setup provides:
- **Isolation**: Won't conflict with other projects
- **Custom ports**: All services use non-standard ports
- **Development-friendly**: Easy to reset and modify
- **No rate limits**: Unlimited API calls
- **Offline capability**: Works without internet

## 📝 Next Steps

After completing this setup:
1. Explore the Archon UI at http://localhost:3737
2. Upload some documents or crawl websites
3. Create projects and tasks
4. Integrate with your AI coding assistant via MCP
5. Customize settings and configurations as needed
