<div align="center">

# 🛡️ Mission Parakram
### Tri-Service OSINT Intelligence Dashboard

![Python](https://img.shields.io/badge/Python-3.11-3776AB?style=for-the-badge&logo=python&logoColor=white)
![FastAPI](https://img.shields.io/badge/FastAPI-Backend-009688?style=for-the-badge&logo=fastapi&logoColor=white)
![React](https://img.shields.io/badge/React-Frontend-61DAFB?style=for-the-badge&logo=react&logoColor=black)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Database-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-Containerized-2496ED?style=for-the-badge&logo=docker&logoColor=white)

</div>

A comprehensive full-stack open-source intelligence (OSINT) platform that fuses Army, Navy, and Air Force domain events into a single unified dashboard. Mission Parakram ingests public conflict, maritime, and aviation incident data, extracts structured events using NLP, and visualizes them on an interactive map and timeline.

---

## 🎯 System Overview

Mission Parakram uses an NLP pipeline (domain classification + NER + relation extraction) to convert unstructured open-source text into structured, queryable intelligence events:

- 🪖 **Army/Ground** event extraction from conflict reporting
- ⚓ **Navy/Maritime** incident tracking (piracy, naval disputes)
- ✈️ **Air Force/Aviation** incident and airspace violation tracking
- 🗺️ **Unified geospatial dashboard** — all three domains on one map
- 📊 **Severity scoring** with explainable, rule-based risk levels
- 🔄 **Automated ingestion** from public OSINT sources

The system applies domain-specific NLP models and provides an evidence-based, explainable severity classification for each extracted event.

---

## 🧰 Features

### Analyst Dashboard
- ✅ Unified map view with domain-coded markers (Army/Navy/Air)
- 🔬 NLP-powered structured event extraction
- 📊 Timeline slider to scrub through events chronologically
- 📈 Severity categorization (CRITICAL/HIGH/MODERATE/LOW)
- 🔍 Event drill-down with source snippet + extracted fields
- 🎚️ Filters by domain, severity, date range, region

### Data Pipeline
- 🌐 Multi-source ingestion (ACLED, GDELT, NTSB, IMB Piracy Reporting)
- 🏷️ Automatic domain classification (Army/Navy/Air)
- 🧩 Named entity recognition (actors, locations, equipment)
- 🔗 Relation extraction (who did what to whom)
- ⚠️ Rule-based severity scoring with explainable factors

---

## 🛠️ Technology Stack

### Backend
- **Framework:** FastAPI
- **Database:** PostgreSQL + PostGIS (geospatial queries)
- **NLP/ML:** spaCy, HuggingFace Transformers (DistilBERT)
- **Ingestion:** Python (requests, pandas), scheduled jobs
- **API:** RESTful, auto-documented via OpenAPI

### Frontend
- **Framework:** React 18 with Vite
- **Styling:** Tailwind CSS
- **Maps:** Leaflet.js
- **Charts/Timeline:** Recharts
- **HTTP Client:** Axios

---

## 📋 Prerequisites

- Python 3.10 or higher
- Node.js 18 or higher
- PostgreSQL 14+ (with PostGIS extension)
- npm or yarn

---

## 🚀 Installation & Setup

### 1. Clone the Repository
```bash
git clone https://github.com/<your-username>/mission-parakram.git
cd mission-parakram
```

### 2. Backend Setup
```bash
# Navigate to backend directory
cd backend

# Create virtual environment
python -m venv venv

# Activate virtual environment
# Windows:
.\venv\Scripts\Activate.ps1
# macOS/Linux:
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Initialize database
python db/init_db.py

# Start FastAPI server
uvicorn main:app --reload
```
The backend will run on `http://localhost:8000`

### 3. Frontend Setup
Open a new terminal and run:
```bash
cd frontend
npm install
npm run dev
```
The frontend will run on `http://localhost:3000`

### 4. Run the NLP Ingestion Pipeline
```bash
cd pipeline
python ingest_acled.py
python ingest_gdelt.py
python ingest_ntsb.py
python run_pipeline.py
```

### 5. (Optional) Run Everything via Docker
```bash
docker-compose up --build
```

---

## 📁 Project Structure

```
mission-parakram/
├── backend/
│   ├── main.py                     # FastAPI application entrypoint
│   ├── routes/
│   │   ├── events.py                # Event query endpoints
│   │   └── ingest.py                # Pipeline trigger endpoints
│   ├── db/
│   │   ├── schema.sql
│   │   └── init_db.py
│   └── requirements.txt
│
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   │   ├── Map/
│   │   │   │   └── EventMap.jsx
│   │   │   ├── Timeline/
│   │   │   │   └── TimelineSlider.jsx
│   │   │   ├── Filters/
│   │   │   │   └── DomainFilter.jsx
│   │   │   └── EventDetail/
│   │   │       └── EventDetailPanel.jsx
│   │   ├── App.jsx
│   │   └── main.jsx
│   ├── package.json
│   └── tailwind.config.js
│
├── pipeline/
│   ├── ingest_acled.py             # Army/ground event ingestion
│   ├── ingest_gdelt.py             # Cross-domain event ingestion
│   ├── ingest_ntsb.py              # Air Force/aviation ingestion
│   ├── domain_classifier.py        # Army/Navy/Air classification
│   ├── ner_extraction.py           # Entity extraction
│   ├── relation_extraction.py      # Actor-action-target extraction
│   └── severity_scoring.py         # Rule-based risk scoring
│
├── docker-compose.yml
└── README.md
```

---

## 📡 API Endpoints

### Events
- `GET /api/events` — Query all events (supports domain, severity, date filters)
- `GET /api/events/{id}` — Get full event detail + source snippet
- `GET /api/events/map` — Get geojson-formatted events for map rendering

### Pipeline
- `POST /api/ingest/run` — Trigger a manual ingestion + processing run
- `GET /api/ingest/status` — Check last pipeline run status

### System
- `GET /api/health` — Health check endpoint

---

## 🎨 Severity Categories

| Category | Criteria | Color | Icon |
|---|---|---|---|
| CRITICAL | Casualties/high-value target involved | Red | 🔴 |
| HIGH | Direct engagement/incident confirmed | Orange | ⚠️ |
| MODERATE | Escalation indicators present | Yellow | 🟡 |
| LOW | Reported but unconfirmed/minor | Green | ✅ |

---

## 🌐 Data Sources & Ethics

| Domain | Source | Access |
|---|---|---|
| Army/Ground | ACLED | Public API |
| Navy/Maritime | IMB Piracy Reporting Centre, GDELT | Public records |
| Air Force/Aviation | NTSB, Aviation Safety Network | Public API/records |

All data is sourced from **public, open-access** repositories. No scraping of restricted, authenticated, or classified sources. This project is intended strictly as an academic/portfolio demonstration of multi-domain NLP-based intelligence fusion.

---

## 🔧 Troubleshooting

**Backend Issues**

Database connection errors:
```bash
cd backend
python db/init_db.py
```

Import errors:
```bash
pip install -r requirements.txt --upgrade
```

**Frontend Issues**

Dependencies not installing:
```bash
rm -r node_modules
rm package-lock.json
npm install
```

Port already in use: edit `vite.config.js` and change the port number.

**Pipeline Issues**

spaCy model not found:
```bash
python -m spacy download en_core_web_sm
```

---

## 📄 License

This is an educational/portfolio demonstration project. Not intended for operational intelligence or defense use without proper validation, data-sharing agreements, and regulatory approval.

## 🎓 Acknowledgments

- ACLED, GDELT, NTSB, and IMB Piracy Reporting Centre for public open-source data
- spaCy and HuggingFace communities
- FastAPI and React ecosystems

---

<div align="center">

⚠️ **DISCLAIMER:** This system is for educational and portfolio purposes only. It uses only publicly available open-source data and is not a substitute for verified intelligence products or official defense systems.

<br/>

**Mission Parakram** — *शौर्यम् दक्षम् युद्धैः*
<br/>
<sub>Three Services, One Vision</sub>

</div>
