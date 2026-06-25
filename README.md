<div align="center">

<!-- Header with left text and right logo -->
<div style="display: flex; align-items: center; justify-content: space-between; width: 100%;">
  <div style="text-align: left;">
    <strong style="font-size: 1.2em;">Color, simple.</strong><br>
    <strong style="font-size: 1em;">Mantra:</strong> Google indexed purity.<br>
    <strong style="font-size: 1em;">Tagline:</strong> Where MD space: 256 hues x 2 stroke & fill = one integer.
  </div>
  <div>
    <img src="https://www.protee.org/images/wmd_tinyMD/wmd_tinyMD.png" alt="wmd_tinyMD Logo" width="120" style="border-radius: 12px;">
  </div>
</div>

<!-- Title and badges -->
# wmd_tinyMD

[![4D Component](https://img.shields.io/badge/4D-Component-blue)](#)
[![4D Pop](https://img.shields.io/badge/4D-Pop-blue)](#)
[![License: Free](https://img.shields.io/badge/License-Free-green.svg)](#license)
[![Platform: macOS & Windows](https://img.shields.io/badge/Platform-macOS%20%7C%20Windows-lightgrey)](#)
[![4D v21+](https://img.shields.io/badge/4D-v21%2B-brightgreen)](#)

</div>

## Overview

wmd_tinyMD is the simple low-level color manager for straightforward use cases. It operates in both RGB and MD (Material Design) indexed color space, providing consistency and design flexibility for your 4D projects. Localized in EN, FR, ES, DE.

SOURCE available here [**wmd_tinyMD.4dbase**](https://github.com/protee/wmd_tinyMD.4dbase)

---

## Key Features

### Supported Color Spaces
- **md**: Material Design (bright and efficient)

### Intelligent Color Editor
The system features a powerful color editor that intelligently handles complex color values. A single long integer can store both Stroke and Fill properties.

### Comprehensive Tools
- **Ready-to-Use Widgets**: Includes color pickers, menus, and other UI elements for seamless integration.
- **Extended Libraries**: Features libraries for `rgb`, `color`, and `svg` operations.
- **Pattern Library**: Includes one pattern from Hero Patterns for simple use.

### Methods Library
- Common utilities
- RGB operations
- New `wmd_md_` methods for Color and Colors
- Miscellaneous utilities

### MD and Indexed Colors Advantages
- Stroke and Fill combined in one long integer
- Limited choice that adds taste to your UI
- Orthogonality allows color's calculations
---

## Installation & Dependencies

### Prerequisites
- **4D v21** or higher (Project mode recommended).
- [**wok_Krolific**](https://github.com/protee/wok_Krolific) – Licensing component (mandatory dependency).
- [**wox_Xlibrary**](https://github.com/protee/wox_Xlibrary) – Core utilities (mandatory dependency).
- The [**4D SVG component**](https://github.com/4d/4D-SVG) must be available in your project.

### Installation via Dependencies Manager (GitHub)

Starting with 4D v21, the recommended way to install wmd_tinyMD (and any ogTools component) is through the **Dependencies Manager** using the **GitHub repository**:

1. In your 4D project, open the **Dependencies Manager** (`Project > Dependencies`).
2. Click the `+` button and select **Add a dependency from a Git URL**.
3. Enter the following Git URL:  
   `protee/wmd_tinyMD`
4. Choose the desired version (e.g., `main`, `latest`, or a specific release tag).
5. Confirm the installation – the component will be automatically fetched from GitHub, placed in the `Components` folder, and linked to your project.

> **Note**: For team development, commit the dependency configuration file (`dependencies.json`) to your source control so all team members automatically fetch the same version from GitHub.

---

## ogTools Suite – Dependencies

wmd_tinyMD is a lightweight color management component within the comprehensive **ogTools suite** – an integrated development ecosystem for 4D. Dependencies:

| Icon | Component | Description |
|------|-----------|-------------|
| <img src="https://www.protee.org/images/wok_Krolific/wok_Krolific.png" alt="wok_Krolific Logo" width="60" style="border-radius: 12px;"> | **wok_Krolific** | License manager. |
| <img src="https://www.protee.org/images/wox_Xlibrary/wox_Xlibrary.png" alt="wox_Xlibrary Logo" width="60" style="border-radius: 12px;"> | **wox_Xlibrary** | Core utilities for everyday development tasks. |

## License

wmd_tinyMD is a **free component** and is part of ogTools suite. No valid license is required for use. 

---

## Localization

wmd_tinyMD supports the following languages out‑of‑the‑box:

- 🇺🇸 English (EN), 🇫🇷 French (FR), 🇪🇸 Spanish (ES), 🇩🇪 German (DE)
- Other on demand

Localization affects error messages, UI prompts, and built‑in pane texts.

---

## Support & Resources

- **Official Website**: [https://www.protee.org](https://www.protee.org)
- **Documentation**: Full documentation and HDI (Host Database Interface) demos are included with your purchase.

For direct inquiries:
- **Email**: [og@protee.org](mailto:og@protee.org)
- **Phone**: +33 6 3718 5941

---

## About the Creator

wmd_tinyMD and the ogToolsSuite are developed by **Protée sarl**, a company with over 30 years of expertise in 4D development. Led by Olivier Grimbert, the team focuses on delivering high‑quality, production‑grade tools that enhance developer productivity and application reliability.

---

<div align="center">
  <sub>Built with ❤️ for the 4D community by Protée sarl. © 2016 - Present</sub>
</div>