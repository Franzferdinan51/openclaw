# Agent Teams Skill - Hive Nation v2.0.0

## Overview

Agent Teams is the **multi-agent coordination layer** for Hive Nation. It enables spawning specialized teams of agents, coordinating workflows, and executing complex tasks through a governance pipeline.

**Author:** DuckBot  
**Version:** 2.0.0  
**Updated:** 2026-04-19  
**Services:** Hive WebUI (3131), Council (3006), MCP (3456)  

---

## Version History

- **v2.0.0** (2026-04-19) - Complete rewrite with governance pipeline, MCP server, BrowserOS integration
- **v1.9.5** - Initial release

---

## Quick Commands

```bash
# Quick CLI
~/.openclaw/workspace/skills/agent-teams/hive-teams.sh <command>

# Governance pipeline
node ~/Desktop/AgentTeam-GitHub/scripts/hive-workflow.js pipeline "Topic"

# Open WebUI
open http://localhost:3131
```

---

## Governance Pipeline (Council → Senate → Teams)

```bash
# Full pipeline: Council debates → Senate passes decree → Teams execute
node ~/Desktop/AgentTeam-GitHub/scripts/hive-workflow.js pipeline "Enhance security"

# Just Council deliberation
node ~/Desktop/AgentTeam-GitHub/scripts/hive-workflow.js council "Should we use 2FA?"

# Just Senate decree
node ~/Desktop/AgentTeam-GitHub/scripts/hive-workflow.js senate "All agents MUST use 2FA"

# Dashboard
node ~/Desktop/AgentTeam-GitHub/scripts/hive-workflow.js dashboard
```

---

## Services

| Service | Port | Description |
|---------|------|-------------|
| Hive WebUI | 3131 | Live dashboard |
| Council | 3006 | 46 councilors |
| MCP Server | 3456 | 23 tools |

---

## MCP Tools (23)

### Senate
- `senate_list` - List senators
- `senate_decrees` - Get decrees
- `senate_create_decree` - Create decree
- `senate_votes` - Historical votes

### Council
- `council_status` - Status
- `council_councilors` - 46 councilors
- `council_modes` - Deliberation modes

### Teams
- `teams_list` - List teams
- `teams_spawn` - Spawn team
- `teams_templates` - Templates

### Governance
- `governance_status` - Pipeline status
- `governance_run` - Run pipeline

---

## Team Templates (16)

| Template | Best For |
|----------|----------|
| `research` | Research workflows |
| `code` | Code development |
| `security` | Security audits |
| `emergency` | Incident response |
| `planning` | Strategic planning |
| `swarm` | Parallel tasks |
| `coalition` | Team-of-teams |

---

## The Governance Loop

```
1. PROBLEM identified
       ↓
2. COUNCIL debates (46 diverse voices)
       ↓
3. Council reaches consensus
       ↓
4. SENATE passes decree (THE LAW)
       ↓
5. TEAMS execute
```

---

## Files

- **GitHub:** https://github.com/Franzferdinan51/Agent-Teams
- **MCP Server:** `~/Desktop/AgentTeam-GitHub/mcp-server.js`
- **WebUI:** `~/Desktop/AgentTeam-GitHub/webui/`

---

**v2.0.0** - Complete governance for multi-agent systems 🏛️⚖️🦆
