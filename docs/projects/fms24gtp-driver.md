---
source: Downloads/FMS24GTP_Driver_README.md + FMS24GTP_QuickStart.md
license: MIT
author: 齋藤みつる (fusamofu) / HIPSTAR IS Company
version: 0.1.0
fold_signature: ψ → ∇φ → λ → Q
---

# FMS24GTP Driver — FileMaker Server 24 × GPT

Driver schema for integrating FileMaker Server 24 with GPT-driven applications.
Control and automate FileMaker Server's Data API through GPT actions.

GitHub: https://github.com/HIPSTAR-IScompany/FMS24GTP_driver

---

## Features

- Full CRUD support for FileMaker Server 24 Data API
- Customizable GPT-driven workflows matching any business logic
- Real-time data manipulation via GPT actions
- Scalable + lightweight — handles large-scale and real-time operations

---

## Quick Start

```bash
git clone https://github.com/HIPSTAR-IScompany/FMS24GTP_driver.git
npm install
```

Set `.env`:
```bash
FILEMAKER_BASE_URL=your_data_center_url
FILEMAKER_WORK_APP=your_custom_app_name
FILEMAKER_API_KEY=your_api_key_here
GTP_KEY=your_gtp_key_here
```

```bash
npm start
```

---

## Setup Flow

1. Clone the repo
2. Install (copy-paste Action + Prompt into your GPT)
3. Generate a login ID for the GPT agent to use with your custom app
4. Prepare screenshots so the GPT can self-study your data structure:
   - FileMaker layout, Table Occurrence editor, sample CSV, manual
5. Configure `.env` — just ask GPT to handle it
6. Start executive-level prompt engineering: teach new users how to use your custom app
7. After learning is done, restrict permissions and tell the GPT agent
8. Deploy your custom GPT — done

---

## Use Cases

- Automate business workflows with FileMaker + GPT
- Build intelligent CRM systems that respond to data in real-time
- Dynamic data-driven applications for healthcare, finance, and more

---

## Contact

- Email: support@hipstar-iscompany.com
- X: [@HIPSTAR_IS](https://twitter.com/HIPSTAR_IS)
- Issues: https://github.com/HIPSTAR-IScompany/FMS24GTP_driver/issues

---

*HIPSTAR IS Company / ZeroRoomLab — MIT License*
