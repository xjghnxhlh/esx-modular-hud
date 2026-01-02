# 🧩 ESX Modular HUD (Food • Thirst • Money • Job)

Un **HUD ESX modulaire, propre et évolutif** pour **FiveM**, regroupant :

* 🍔 Faim
* 💧 Soif
* 💵 Argent liquide
* 🧼 Argent sale
* 🏦 Banque
* 👔 Métier
* ⭐ Grade

👉 Ce HUD est **volontairement simple et bien structuré**, afin d’être **facilement amélioré, étendu ou redesigné** selon les besoins de ton serveur.

---

## ✨ Fonctionnalités

* HUD **double** :

  * Bas gauche : **Faim / Soif**
  * Haut droit : **Job / Grade + Argent**
* Mise à jour **temps réel** (1 seconde)
* Basé sur **ESX + esx_status**
* Interface **NUI (HTML / CSS / JS)**
* Design moderne (dégradé, hover, lisible)
* Code **commenté et clair**
* Structure prête pour ajouts futurs

---

## 📦 Structure de la ressource

```text
esx_modular_hud/
│
├── fxmanifest.lua
├── client.lua          # HUD argent + job
├── server.lua          # Récupération comptes & job
│
├── client_status.lua   # HUD faim / soif
├── server_status.lua   # (optionnel / extensible)
│
└── html/
    ├── index.html
    ├── style.css
    └── script.js
```

---

## 🧩 Dépendances obligatoires

Cette ressource nécessite :

* **es_extended** (ESX Legacy ou récent)
* **esx_status** (pour faim / soif)

```cfg
ensure es_extended
ensure esx_status
ensure esx_modular_hud
```

---

## ⚙️ Installation

1. 📥 Télécharger ou cloner le dépôt
2. 📂 Placer le dossier dans `resources/`
3. ✏️ Vérifier le nom du dossier (ex: `esx_modular_hud`)
4. ▶️ Ajouter dans `server.cfg`
5. 🔄 Redémarrer le serveur

---

## 🧠 Fonctionnement détaillé

### 🔹 HUD Faim / Soif

#### Source des données

* `esx_status:getStatus`
* Status utilisés :

  * `hunger`
  * `thirst`

#### Logique

* Valeurs récupérées (0 → max)
* Conversion en **pourcentage**
* Envoi à la NUI via `SendNUIMessage`

📍 Position : **bas gauche**, proche de la minimap

---

### 🔹 HUD Argent & Job

#### Comptes affichés

* 💵 Argent liquide (`money`)
* 🧼 Argent sale (`black_money`)
* 🏦 Banque (`bank`)

#### Job

* 👔 Label du métier
* ⭐ Grade du métier

#### Fonctionnement

1. Le client déclenche :

   ```lua
   TriggerServerEvent('hud:getAccounts')
   ```
2. Le serveur récupère :

   * Comptes ESX
   * Job + grade
3. Les données sont renvoyées au client
4. La NUI est mise à jour

⏱️ Rafraîchissement : toutes les **1 seconde**

📍 Position : **haut droit**

---

## 🖥️ Interface NUI (HTML / CSS / JS)

### `index.html`

* HUD Job
* HUD Argent
* HUD Faim / Soif
* Structure volontairement simple

---

### `script.js`

* Écoute des messages FiveM :

  * `updateMoney`
  * `updateJob`
  * `update` (faim / soif)
* Sécurisation des valeurs
* Mise à jour dynamique sans reload

---

### `style.css`

* Positionnement précis par HUD
* Dégradé moderne
* Hover discret
* Facilement personnalisable :

  * Taille
  * Couleurs
  * Position
  * Police

---

## 🎨 Personnalisation rapide

### 📍 Changer la position

```css
#hud-job {
    top: 2%;
    right: 2%;
}

#hud-stats {
    bottom: 2%;
    left: 17%;
}
```

### 🎨 Changer les couleurs

```css
background: linear-gradient(90deg, #0055A4 0%, #ffffff 50%, #EF4135 100%);
```

---

## 🧪 Compatibilité

| Élément    | Support |
| ---------- | ------- |
| ESX Legacy | ✅       |
| ESX récent | ✅       |
| esx_status | ✅       |
| ox_status  | ❌       |
| QB-Core    | ❌       |

---

## 🚀 Améliorations prévues / possibles

* Barres progressives (au lieu du %)
* Animations CSS
* Toggle HUD (commande / touche)
* Support ox_status
* Support multi-job
* Configuration JSON
* Mode minimaliste

👉 **Ce HUD est conçu pour être amélioré**, pas figé.

---

## 📄 Licence

Utilisation libre pour serveurs **FiveM**.

❌ Revente interdite
❌ Claim du script interdit

---

## 👤 Auteur

**HUD Custom Premium**
ESX Modular HUD – Food • Thirst • Money • Job

---

⭐ Si le projet t’aide, pense à laisser une étoile sur GitHub
