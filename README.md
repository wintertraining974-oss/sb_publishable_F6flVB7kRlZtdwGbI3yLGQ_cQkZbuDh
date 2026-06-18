# Planning Athlétisme 🏃

Application web de planning de séances d'athlétisme, développée avec **Next.js**, **Supabase** (base de données temps réel) et déployée sur **Vercel**.

---

## 🚀 Déploiement en 5 étapes

### Étape 1 — Créer le projet Supabase

1. Allez sur [supabase.com](https://supabase.com) → **New Project**
2. Nommez-le `planning-athletisme`, choisissez la région **Europe West** (Paris)
3. Attendez ~1 minute que le projet se crée
4. Allez dans **SQL Editor** → **New Query**
5. Copiez-collez tout le contenu du fichier `supabase_schema.sql` et cliquez **Run**
6. Récupérez vos clés :
   - **Project URL** : Settings → API → Project URL
   - **Anon Key** : Settings → API → anon public

### Étape 2 — Créer le dépôt GitHub

1. Allez sur [github.com](https://github.com) → **New repository**
2. Nommez-le `planning-athletisme`, mettez-le en **Public** ou **Private**
3. Cliquez **Create repository**
4. Sur votre ordinateur (ou via l'interface GitHub), uploadez tous les fichiers de ce projet

> **Si vous uploadez via GitHub.com :**
> - Cliquez "uploading an existing file"
> - Glissez-déposez tous les fichiers (respectez l'arborescence)
> - Commit "Initial commit"

### Étape 3 — Connecter à Vercel

1. Allez sur [vercel.com](https://vercel.com) → **New Project**
2. Importez votre dépôt GitHub `planning-athletisme`
3. Framework détecté automatiquement : **Next.js** ✓
4. Avant de déployer, ajoutez les variables d'environnement :
   - `NEXT_PUBLIC_SUPABASE_URL` = votre Project URL Supabase
   - `NEXT_PUBLIC_SUPABASE_ANON_KEY` = votre Anon Key Supabase
5. Cliquez **Deploy**

### Étape 4 — Activer le Realtime Supabase

1. Dans Supabase → **Database** → **Replication**
2. Activez **Realtime** sur les tables `inscriptions` et `config`

### Étape 5 — Partager le lien

Vercel vous donne une URL du type :
```
https://planning-athletisme-xxxx.vercel.app
```
Envoyez ce lien dans votre groupe WhatsApp — tous les athlètes voient les mêmes données en temps réel !

---

## 🔑 Code admin

**Code : `3103`**

En mode admin, vous pouvez :
- Modifier l'ordre de priorité des créneaux
- Changer la capacité de chaque créneau
- Fermer / ouvrir des jours ponctuellement
- Déplacer un athlète vers un autre créneau

---

## 📅 Jours fériés (dates fixes)

| Date | Férié |
|------|-------|
| 1er novembre 2026 | Toussaint |
| 11 novembre 2026 | Armistice 1918 |
| 20 décembre 2026 | Abolition de l'esclavage |
| 25 décembre 2026 | Noël |
| 1er janvier 2027 | Jour de l'An |

---

## 🏗 Architecture

```
planning-athletisme/
├── pages/
│   ├── _app.js          # App wrapper
│   └── index.js         # Page principale (toute la logique)
├── lib/
│   ├── supabase.js      # Client Supabase
│   └── constants.js     # Jours fériés, créneaux, config
├── styles/
│   └── globals.css      # Variables CSS globales
├── supabase_schema.sql  # Script SQL à exécuter dans Supabase
├── .env.local.example   # Variables d'environnement (modèle)
├── next.config.js
└── package.json
```
