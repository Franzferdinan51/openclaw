# 🦆 Duck Bot — OpenClaw Configuration Example

**A fully operational OpenClaw workspace with Duck CLI, AI Council, Agent Teams, and custom skills.**

This is a reference deployment of OpenClaw on Ryan's Mac mini (Darwin ARM64) — showing real integrations, working skills, and a production-ready agent setup you can learn from and adapt.

> **For OpenClaw core:** This example lives in `examples/duck-bot/` in the [openclaw fork](https://github.com/Franzferdinan51/openclaw). It demonstrates Duck Bot's configuration, skills, docs, and integrations alongside the core OpenClaw codebase.

---

## What's in here

| File/Folder | Purpose |
|-------------|---------|
| `AGENTS.md` | Agent hierarchy (Chat Agent, Meta-Agent, Sub-Conscious, Mesh Agent) |
| `SOUL.md` | Duck Bot personality and operational rules |
| `IDENTITY.md` | Brand, voice, and system boundaries |
| `USER.md` | User guide and quick reference |
| `BOOTSTRAP.md` | Quick start and directory structure |
| `TOOLS.md` | Complete tool registry reference |
| `HEARTBEAT.md` | Chief-of-staff heartbeat configuration |
| `docs/` | Technical deep-dives (architecture, orchestrator, commands, etc.) |
| `skills/` | Installed skills: agent-teams, messaging-control, git-workflow, mmx-cli, context-memory, + more |

---

## Key Integrations

### 🤖 AI Council (port 3006)
- **52 councilors** across 8 categories
- 6 cannabis specialist councilors (The Cultivator, The Trichome Inspector, The Nutrient Manager, The IPM Specialist, The Cure Master, The Compliance Officer)
- 9 deliberation modes (legislative, deliberation, inquiry, research, swarm, swarm_coding, prediction, government, inspector)
- Deliberation stored in SQLite, council verdicts published to Agent Mesh

### 🔧 Duck CLI Integration
- `duck cannaai status|monitor|analyze|alerts|plants|council|schedule` — CannaAI grow monitoring commands
- `duck council` — direct AI Council deliberation
- `duck mesh` — Agent Mesh networking commands
- `duck meta plan|run|learnings` — Meta-Agent orchestration
- MCP server on port 3850, ACP server on port 18794

### 🌐 Agent Mesh (port 4000)
- Duck CLI registers as `DuckBot-CLI`
- Dashboard registers as `DuckBot-Dashboard`
- Real-time messaging, broadcast, collective memory

### 🎯 Provider Stack
- **MiniMax** (primary, generous quota)
- **Kimi** (vision + coding)
- **ChatGPT OAuth** (premium reasoning)
- **LM Studio** (local, free — qwen3.5-9b, gemma-4-e4b-it)
- **OpenRouter** (free tier fallback)
- **Windows LM Link** (Qwen 3.6 35B on 128GB PC via LAN)

### 📱 Phone Control (Moto G Play 2026)
- OpenClaw Android via Termux (`oa` alias)
- Wireless ADB at `192.168.1.251:5555`
- Gemma-4-e4b-it for Android tool-calling
- Camera for plant monitoring + vision analysis

### 🌿 CannaAI (port 3007)
- Cannabis cultivation management platform
- `/api/ai-insights` — predictive AI co-pilot (VPD, temp, humidity trend analysis)
- `/api/health-check` — full stack health (DB + LM Studio + OpenClaw)
- MCP v2 with 29 tools
- PWA manifest + service worker

---

## Quick Start

```bash
# OpenClaw onboard
openclaw onboard

# Clone this workspace (if you want Duck Bot's exact setup)
# Note: openclaw.json is private — copy the workspace files only
cp examples/duck-bot/AGENTS.md ~/.openclaw/workspace/
cp examples/duck-bot/SOUL.md ~/.openclaw/workspace/
cp -r examples/duck-bot/skills/ ~/.openclaw/workspace/skills/
cp -r examples/duck-bot/docs/ ~/.openclaw/workspace/docs/

# Start AI Council
cd ~/Desktop/AI-Bot-Council-Concensus && node server.js &

# Start OpenClaw
openclaw gateway start
```

---

## For Duck Bot Developers

### Architecture
```
OpenClaw Gateway (port 18789)
├── Chat Agent (port 18797) — user-facing, complexity scoring
├── Hybrid Orchestrator v4 — routes tasks by complexity
│   ├── Fast path (1-3) — direct execution
│   ├── Multi-step (4-6) — best model routing
│   └── Full meta-agent (7+) — Planner → Execute → Critic → Heal → Learn
├── Sub-Conscious (port 4001) — LLM-powered memory
├── Agent Mesh (port 4000) — inter-agent communication
└── MCP Server (port 3850) — tool exposure
```

### Skills Available
- `agent-teams` — Multi-agent coordination with meta-agent lifecycle
- `messaging-control` — iMessage, Telegram, WhatsApp sending
- `mmx-cli` — MiniMax speech, image, music, video generation
- `git-workflow` — advanced git operations
- `context-memory` — session context management

---

**Last Updated:** April 19, 2026
**Maintainer:** Ryan (Duckets) — [GitHub](https://github.com/Franzferdinan51)