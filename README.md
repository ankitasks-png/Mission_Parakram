
<div align="center">
🛡️ Mission Parakram
Tri-Service OSINT Intelligence Dashboard

Unified open-source intelligence fusion across Army, Navy & Air domains

<br/>

Show Image Show Image Show Image Show Image Show Image Show Image Show Image Show Image Show Image

</div>
📖 Overview

Mission Parakram is a tri-service open-source intelligence (OSINT) dashboard that ingests publicly available conflict, maritime, and aviation incident data — extracts structured events using NLP — and visualizes them on a unified, filterable map and timeline.

It fuses three independently-tracked domains into a single operational picture:

Domain	Source	Focus
🪖 Army / Ground	ACLED	Conflict events, troop movements, engagements
⚓ Navy / Maritime	IMB Piracy Reporting Centre, GDELT	Piracy, naval incidents, maritime disputes
✈️ Air Force / Aviation	NTSB, ASN	Airspace incidents, mishaps, intercepts
🏗️ Architecture
Raw Text (ACLED / GDELT / NTSB / IMB)
        │
        ▼
 Domain Classifier  ──▶  Army / Navy / Air
        │
        ▼
   NER + Relation Extraction  ──▶  Actor, Action, Target, Location, Date
        │
        ▼
  Severity Scoring  ──▶  Structured Event Record (JSON)
        │
        ▼
  PostgreSQL + PostGIS
        │
        ▼
  FastAPI Backend  ──▶  React Dashboard (Map + Timeline)
🧰 Tech Stack
<table> <tr> <td align="center" width="100"><img src="https://cdn.simpleicons.org/python/3776AB" width="40"/><br/><b>Python</b></td> <td align="center" width="100"><img src="https://cdn.simpleicons.org/fastapi/009688" width="40"/><br/><b>FastAPI</b></td> <td align="center" width="100"><img src="https://cdn.simpleicons.org/react/61DAFB" width="40"/><br/><b>React</b></td> <td align="center" width="100"><img src="https://cdn.simpleicons.org/postgresql/4169E1" width="40"/><br/><b>PostgreSQL</b></td> <td align="center" width="100"><img src="https://cdn.simpleicons.org/docker/2496ED" width="40"/><br/><b>Docker</b></td> </tr> <tr> <td align="center" width="100"><img src="https://cdn.simpleicons.org/spacy/09A3D5" width="40"/><br/><b>spaCy</b></td> <td align="center" width="100"><img src="https://cdn.simpleicons.org/huggingface/FFD21E" width="40"/><br/><b>HuggingFace</b></td> <td align="center" width="100"><img src="https://cdn.simpleicons.org/leaflet/199900" width="40"/><br/><b>Leaflet</b></td> <td align="center" width="100"><img src="https://cdn.simpleicons.org/pandas/150458" width="40"/><br/><b>Pandas</b></td> <td align="center" width="100"><img src="https://cdn.simpleicons.org/postman/FF6C37" width="40"/><br/><b>REST API</b></td> </tr> </table>
Layer	Technology	Purpose
Frontend	React + Leaflet.js + Recharts	Interactive map, timeline slider, domain/severity filters
Backend API	FastAPI	Serves structured event data via REST endpoints
Database	PostgreSQL + PostGIS	Stores geotagged event records, enables spatial queries
NLP Pipeline	spaCy, HuggingFace Transformers (DistilBERT)	Domain classification, NER, relation extraction
Ingestion	Python (requests, pandas)	Pulls data from ACLED / GDELT / NTSB / IMB APIs
Deployment	Docker Compose	Containerized, reproducible local/cloud deployment
📂 Repository Structure
mission-parakram/
├── frontend/              # React dashboard
├── backend/                # FastAPI application
│   ├── main.py
│   └── routes/
├── pipeline/                # Data ingestion + NLP processing
│   ├── ingest_acled.py
│   ├── ingest_gdelt.py
│   ├── ingest_ntsb.py
│   ├── domain_classifier.py
│   ├── ner_extraction.py
│   └── severity_scoring.py
├── db/
│   └── schema.sql
├── docker-compose.yml
└── README.md
⚙️ Setup
bash
# Clone the repository
git clone https://github.com/<your-username>/mission-parakram.git
cd mission-parakram

# Spin up all services
docker-compose up --build

# Backend available at:   http://localhost:8000
# Frontend available at:  http://localhost:3000
🗺️ Features
🌐 Unified map view — all three domains plotted with distinct markers
🕒 Timeline slider — scrub through events chronologically
🎚️ Filters — by domain (Army/Navy/Air), severity, date range
🔍 Event drill-down — structured fields + original source snippet
🔄 Automated refresh — scheduled ingestion pipeline keeps data current
📜 Data Sources & Ethics

All data is sourced from public, open-access APIs and repositories (ACLED, GDELT, NTSB, IMB Piracy Reporting Centre). No scraping of restricted or authenticated sources. Intended strictly as an academic/portfolio demonstration of multi-domain NLP-based intelligence fusion.

<div align="center">

Mission Parakram — तीन सेनाएं, एक दृष्टि <br/> <sub>Three Services, One Vision</sub>

</div>
