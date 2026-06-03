CREATE TABLE IF NOT EXISTS settings (
  id INTEGER PRIMARY KEY,
  admin_user TEXT NOT NULL DEFAULT 'admin',
  admin_pass TEXT NOT NULL DEFAULT 'SecretPassword123'
);

INSERT OR IGNORE INTO settings (id, admin_user, admin_pass)
VALUES (1, 'admin', 'SecretPassword123');

CREATE TABLE IF NOT EXISTS users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT NOT NULL UNIQUE,
  password TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'active',
  exp_date TEXT NOT NULL DEFAULT 'Never',
  max_connections INTEGER NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS streams (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  url TEXT NOT NULL,
  category TEXT NOT NULL DEFAULT 'Live'
);

CREATE TABLE IF NOT EXISTS proxies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  url TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS comments (
  id INTEGER PRIMARY KEY,
  content TEXT NOT NULL DEFAULT '',
  updated_at TEXT
);

INSERT OR IGNORE INTO comments (id, content, updated_at)
VALUES (1, '', datetime('now'));
