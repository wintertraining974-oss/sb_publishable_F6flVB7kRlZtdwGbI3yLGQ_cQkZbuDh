-- ============================================================
-- SCHEMA SUPABASE — Planning Athlétisme
-- À coller dans Supabase > SQL Editor > New Query > Run
-- ============================================================

-- 1. TABLE CONFIG (priorités, capacités, jours fermés admin)
CREATE TABLE IF NOT EXISTS config (
  id      TEXT PRIMARY KEY DEFAULT 'global',
  data    JSONB NOT NULL DEFAULT '{}'::jsonb,
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- Insérer la config par défaut
INSERT INTO config (id, data) VALUES (
  'global',
  '{
    "priorityOn": true,
    "morningOrder": ["9h-10h","10h-11h","11h-12h"],
    "afternoonOrder": ["15h-16h","14h-15h","13h-14h"],
    "capacity": {
      "9h-10h":15,"10h-11h":15,"11h-12h":15,
      "15h-16h":15,"14h-15h":15,"13h-14h":15
    },
    "customClosed": {}
  }'
) ON CONFLICT (id) DO NOTHING;

-- 2. TABLE INSCRIPTIONS
CREATE TABLE IF NOT EXISTS inscriptions (
  id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  date_key   TEXT NOT NULL,       -- ex: '2026-11-03'
  slot       TEXT NOT NULL,       -- ex: '9h-10h'
  name       TEXT NOT NULL,
  role       TEXT NOT NULL DEFAULT 'Athlète',
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_inscriptions_date_slot ON inscriptions(date_key, slot);

-- 3. REALTIME — activer sur les deux tables
ALTER TABLE inscriptions REPLICA IDENTITY FULL;
ALTER TABLE config       REPLICA IDENTITY FULL;

-- 4. RLS (Row Level Security) — accès public en lecture/écriture
ALTER TABLE inscriptions ENABLE ROW LEVEL SECURITY;
ALTER TABLE config       ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Lecture publique inscriptions"  ON inscriptions FOR SELECT USING (true);
CREATE POLICY "Écriture publique inscriptions" ON inscriptions FOR INSERT WITH CHECK (true);
CREATE POLICY "Suppression publique inscriptions" ON inscriptions FOR DELETE USING (true);

CREATE POLICY "Lecture publique config"  ON config FOR SELECT USING (true);
CREATE POLICY "Mise à jour config"       ON config FOR UPDATE USING (true);
