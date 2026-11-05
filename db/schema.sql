CREATE TABLE IF NOT EXISTS events (
    id BIGSERIAL PRIMARY KEY,

    title VARCHAR(300) NOT NULL,
    description TEXT,

    domain VARCHAR(20) NOT NULL
        CHECK (domain IN ('ARMY', 'NAVY', 'AIR')),

    event_type VARCHAR(100),

    location_name VARCHAR(255),
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,

    geom GEOGRAPHY(POINT, 4326),

    event_time TIMESTAMPTZ,
    reported_at TIMESTAMPTZ,

    source_name VARCHAR(150),
    source_url TEXT,

    raw_text TEXT,

    severity_level VARCHAR(20)
        CHECK (
            severity_level IN (
                'CRITICAL',
                'HIGH',
                'MODERATE',
                'LOW'
            )
        ),

    severity_score NUMERIC(5,2)
        CHECK (
            severity_score IS NULL
            OR severity_score BETWEEN 0 AND 100
        ),

    confidence_score NUMERIC(5,4)
        CHECK (
            confidence_score IS NULL
            OR confidence_score BETWEEN 0 AND 1
        ),

    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,

    CHECK (
        latitude IS NULL OR latitude BETWEEN -90 AND 90
    ),

    CHECK (
        longitude IS NULL OR longitude BETWEEN -180 AND 180
    )
);

CREATE INDEX IF NOT EXISTS idx_events_domain
ON events(domain);

CREATE INDEX IF NOT EXISTS idx_events_severity
ON events(severity_level);

CREATE INDEX IF NOT EXISTS idx_events_time
ON events(event_time);

CREATE INDEX IF NOT EXISTS idx_events_geom
ON events USING GIST(geom);