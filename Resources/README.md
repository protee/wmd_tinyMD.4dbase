<div align="center">

<!-- Header with left text and right logo -->
<div style="display: flex; align-items: center; justify-content: space-between; width: 100%;">
  <div style="text-align: left;">
    <strong style="font-size: 1.2em;">MD, purely.</strong><br>
    <strong style="font-size: 1em;">Mantra:</strong> One space. One style. No bloat.<br>
    <strong style="font-size: 1em;">Tagline:</strong> Material Design, simplified.
  </div>
  <div>
    <img src="https://www.protee.org/images/wmd_tinyMD/wmd_tinyMD.png" alt="wmd_tinyMD Logo" width="60" style="border-radius: 12px;">
  </div>
</div>

<!-- Title and badges -->
# wmd_tinyMD

[![4D Component](https://img.shields.io/badge/4D-Component-blue)](#)
[![License: Free](https://img.shields.io/badge/License-Free-brightgreen.svg)](#license)
[![Platform: macOS & Windows](https://img.shields.io/badge/Platform-macOS%20%7C%20Windows-lightgrey)](#)
[![4D v21+](https://img.shields.io/badge/4D-v21%2B-brightgreen)](#)
[![Source on GitHub](https://img.shields.io/badge/Source-GitHub-181717?logo=github)](https://github.com/protee/wmd_tinyMD_SRC)

</div>

---

## Overview

**wmd_tinyMD** is the ultra‑lightweight color component from the **ogTools suite** – a focused, single‑space version of the full‑featured `woc_Colours`. It delivers all the power of Material Design indexing, combined with a simple, one‑shape pattern library. Perfect for projects that want the elegance of MD without the complexity of multiple color spaces.

**This component is free and open‑source** – source code is available on [GitHub](https://github.com/protee/wmd_tinyMD_SRC).

---

## Key Features

### One Color Space
- **md** – Material Design (bright, efficient, and tasteful)

### Single Pattern
- **One shape** (from the Hero Patterns collection) – easy to use, easy to customize.

### Indexed Color Simplicity
- Stroke and Fill combined in one long integer.
- Limited, curated choices that keep your UI consistent.
- Display and copy colors in multiple formats: `[0x0…]`, `[md:index] name`, numeric values, `rgb(r,g,b)`, `0xrrggbb`, etc.

### Smart Color Editor
A single long integer stores both Stroke and Fill. The editor UI adapts dynamically, keeping color samples perfectly squared and conversions seamless.

---

## Installation

### Prerequisites
- **4D v21** or higher (Project mode recommended).
- [**wok_Krolific**](https://github.com/protee/wok_Krolific) – Licensing component (mandatory dependency).
- [**wox_Xlibrary**](https://github.com/protee/wox_Xlibrary) – Core utilities (mandatory dependency).
- The [**4D SVG component**](https://github.com/4d/4D-SVG) must be available in your project.

### Via Dependencies Manager (GitHub)

1. In your 4D project, open the **Dependencies Manager** (`Project > Dependencies`).
2. Click the `+` button and select **Add a dependency from a Git URL**.
3. Enter the following Git URL: `protee/wmd_tinyMD`
4. Choose the desired version (e.g., `main`, `latest`, or a specific release tag).
5. Confirm the installation – the component will be automatically fetched from GitHub, placed in the `Components` folder, and linked to your project.

> **Note**: For team development, commit the dependency configuration file (`dependencies.json`) to your source control so all team members automatically fetch the same version from GitHub.

### Manual Download
You can also clone or download the source directly from the [GitHub repository](https://github.com/protee/wmd_tinyMD) and place the component folder in your project's `Components` directory.

---

## Part of the ogTools Suite

wmd_tinyMD is the minimal color management pillar of the comprehensive **ogTools suite**—an integrated development ecosystem for 4D. Other key components include:

| Component | Description |
|-----------|-------------|
| **wok_Krolific** | Centralized licensing system. |
| **wox_Xlibrary** | Core utilities for everyday development tasks. |
| **zen_Nucleus** | The complete ORDA framework binding your database to a sophisticated UI. |
| **waz_Wazar** | Intelligent UI widgets for modern interfaces. |
| **wor_Recursive** | Manage hierarchical data with ease. |
| **wob_Boxes** | Secure, Dropbox-like file repository. |
| **wod_DevTools** | Instant documentation generation. |
| **wom_Make** | Build and automation toolkit. |
| **woc_Colours** | The full, multi‑space color engine (if you need more). |

> Together, these components form a powerful framework that allows developers to focus on unique business logic rather than reinventing the wheel.

---

## License

**wmd_tinyMD is free** and distributed with source code available on [GitHub](https://github.com/protee/wmd_tinyMD_SRC).  
You are free to use, modify, and distribute it as long as you comply with the terms stated in the repository (see the `LICENSE` file for details).

---

## Localization

wmd_tinyMD supports the following languages out‑of‑the‑box:

- 🇺🇸 English (EN)
- 🇫🇷 French (FR)
- 🇪🇸 Spanish (ES)
- 🇩🇪 German (DE)

Localization affects error messages, UI prompts, and built‑in pane texts.

---

## Support & Resources

- **Official Website**: [https://www.protee.org](https://www.protee.org)
- **Documentation**: Full documentation and HDI (Host Database Interface) demos are included with your purchase.
- **Source Code**: [https://github.com/protee/wmd_tinyMD_SRC](https://github.com/protee/wmd_tinyMD_SRC)

For direct inquiries:
- **Email**: [og@protee.org](mailto:og@protee.org)
- **Phone**: +33 6 3718 5941

---

## About the Creator

wmd_tinyMD and the ogTools suite are developed by **Protée sarl**, a company with over 30 years of expertise in 4D development. Led by Olivier Grimbert, the team focuses on delivering high‑quality, production‑grade tools that enhance developer productivity and application reliability.

---

<div align="center">
  <sub>Built with ❤️ for the 4D community by Protée sarl. © 2016 - Present</sub>
</div>