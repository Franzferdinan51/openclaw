#!/bin/bash
# Hive Nation Quick Commands
# Usage: hive-teams.sh <command>

HIVE_DIR="$HOME/Desktop/AgentTeam-GitHub"
HIVE_PORT=3131
COUNCIL_PORT=3006
MCP_PORT=3456

case "$1" in
    start)
        echo "🚀 Starting Hive Nation..."
        cd "$HIVE_DIR"
        node webui/server.js &
        sleep 2
        echo "✅ WebUI: http://localhost:$HIVE_PORT"
        ;;
        
    council)
        echo "🏛️ Starting Council..."
        cd "$HOME/Desktop/AI-Bot-Council-Concensus"
        node server.js &
        sleep 2
        echo "✅ Council: http://localhost:$COUNCIL_PORT"
        ;;
        
    mcp)
        echo "🔌 Starting MCP Server..."
        cd "$HIVE_DIR"
        node mcp-server.js &
        sleep 2
        echo "✅ MCP: http://localhost:$MCP_PORT"
        ;;
        
    all)
        echo "🚀 Starting all services..."
        "$0" council
        sleep 1
        "$0" mcp
        sleep 1
        "$0" start
        ;;
        
    status)
        echo "📊 Hive Nation Status"
        curl -s http://localhost:$HIVE_PORT/api/health > /dev/null 2>&1 && echo "✅ WebUI: $HIVE_PORT" || echo "❌ WebUI: $HIVE_PORT"
        curl -s http://localhost:$COUNCIL_PORT/api/health > /dev/null 2>&1 && echo "✅ Council: $COUNCIL_PORT" || echo "❌ Council: $COUNCIL_PORT"
        curl -s http://localhost:$MCP_PORT/health > /dev/null 2>&1 && echo "✅ MCP: $MCP_PORT" || echo "❌ MCP: $MCP_PORT"
        ;;
        
    open)
        open http://localhost:$HIVE_PORT
        ;;
        
    council-open)
        open http://localhost:$COUNCIL_PORT
        ;;
        
    workflow)
        shift
        cd "$HIVE_DIR"
        node scripts/hive-workflow.js "$@"
        ;;
        
    teams)
        shift
        cd "$HIVE_DIR"
        node scripts/hive-teams.js "$@"
        ;;
        
    senate)
        shift
        cd "$HIVE_DIR"
        node scripts/hive-senate-complete.js "$@"
        ;;
        
    memory)
        shift
        cd "$HIVE_DIR"
        node scripts/hive-memory.js "$@"
        ;;
        
    dashboard)
        curl -s http://localhost:$HIVE_PORT/api/dashboard | python3 -m json.tool 2>/dev/null || echo "Run 'hive-teams.sh start' first"
        ;;
        
    decrees)
        curl -s http://localhost:$HIVE_PORT/api/decrees | python3 -m json.tool 2>/dev/null || echo "Run 'hive-teams.sh start' first"
        ;;
        
    votes)
        curl -s http://localhost:$HIVE_PORT/api/votes | python3 -m json.tool 2>/dev/null || echo "Run 'hive-teams.sh start' first"
        ;;
        
    health)
        echo "🏥 System Health"
        curl -s http://localhost:$HIVE_PORT/api/monitoring | python3 -m json.tool 2>/dev/null || echo "Run 'hive-teams.sh start' first"
        ;;
        
    help|*)
        echo "
🏛️ Hive Nation Commands
========================

START/STOP:
  hive-teams.sh start      Start WebUI
  hive-teams.sh council    Start Council
  hive-teams.sh mcp        Start MCP Server
  hive-teams.sh all        Start all services

STATUS:
  hive-teams.sh status     Check all services
  hive-teams.sh dashboard  Full dashboard
  hive-teams.sh health     System health

OPEN:
  hive-teams.sh open       Open WebUI
  hive-teams.sh council-open  Open Council

GOVERNANCE:
  hive-teams.sh workflow <cmd>  Run governance pipeline
  hive-teams.sh teams <cmd>     Team commands
  hive-teams.sh senate <cmd>   Senate commands
  hive-teams.sh memory <cmd>    Memory commands

DATA:
  hive-teams.sh decrees    List decrees
  hive-teams.sh votes      List votes

EXAMPLES:
  hive-teams.sh all
  hive-teams.sh workflow pipeline 'Enhance security'
  hive-teams.sh workflow council 'Should we use 2FA?'
  hive-teams.sh teams spawn research 'My Research Team'
  hive-teams.sh decrees
"
        ;;
esac
