<!--    
    ================================================================================================
    
    Copyright (c) 2026 Ilya Snegov (aka Sierra Arn)
    
    Dedicated to the public domain under the Creative Commons
    CC0 1.0 Universal Public Domain Dedication (the "Dedication").
    You may obtain a copy of the Dedication at
    
    https://creativecommons.org/publicdomain/zero/1.0/legalcode.en

    ================================================================================================
    README.md
    ================================================================================================
-->

# Score Forge for Opus One

> *A Pixi workspace for building publication-ready PDF scores of «Sierra Arn — Composizioni, Op. 1» from MuseScore sources.*

[![License: Apache-2.0](https://img.shields.io/badge/License-Apache--2.0-blue.svg)](#license)
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-blue.svg)](#license)
[![License: CC0 1.0](https://img.shields.io/badge/License-CC0%201.0-blue.svg)](#license)

> **Note:**  
> If you only need the finished PDF scores and do not want to set up this workspace locally, download them from the [PDF release](https://github.com/snegoviol/score-forge-opus-one/releases/tag/v2026.09.04). The MuseScore sources (`.mscz`) live in this repository under `composizioni/Op-1_No-*/`; see [Project Structure at a Glance](#project-structure-at-a-glance) and [Detailed Project Structure](docs/02-project-structure.md) for details.

<!--    
    ================================================================================================
-->

## Project Structure at a Glance

```
score-forge-opus-one/
├── composizioni/       # Musical sources for `Composizioni, Op. 1`. 
│                       # Each `Op-1_No-*/` subdirectory represents one musical
│                       # piece; `paratext/` represents shared Typst library.
│
├── recipes/            # Local conda packages built via `pixi-build` and 
│                       # declared as workspace dependencies. Each subdirectory
│                       # represents one local conda package recipe.
│
├── docs/               # Technical documentation covering workspace dependencies,
│                       # and detailed project structure.
│
├── LICENSES/           # Full texts of all licenses used in the project.
│
├── LICENSE.txt         # Licensing overview: which license applies to which files.
│
├── metadata.toml       # Shared release metadata (used by workspace CLIs).
│
├── pixi.toml           # Workspace manifest: channels, dependencies, and tasks.
│
└── pixi.lock           # Fully resolved and reproducible dependency lockfile.
```

<!--    
    ================================================================================================
-->

## Quick Start

### I. Prerequisites

| Component            | Requirement                               |
| :------------------- | :---------------------------------------- |
| **Package Manager**  | [`Pixi`](https://pixi.prefix.dev/latest/) |
| **Operating System** | GNU/Linux-based system                    |
| **Architecture**     | `x86_64`                                  |

> **Note:**  
> These are not strict requirements, but rather the baseline environment where the code is 
guaranteed to run out of the box. Alternative setups are possible but may require manual 
configuration.

<!--    
    ================================================================================================
-->

### II. Setup

1. **Clone the repository**

    ```bash
    git clone https://github.com/snegoviol/score-forge-opus-one.git
    cd score-forge-opus-one
    ```

2. **Install dependencies**

    ```bash
    pixi install
    ```

    > **Note:**  
    > 1. MuseScore is built from source during `pixi install` and can take a considerable amount of time.
    > 2. Many compiler warnings while building MuseScore are expected and can be ignored.

3. **Activate environment**

    ```bash
    pixi shell
    ```

<!--    
    ================================================================================================
-->

### III. Build

With the environment activated, publication-ready PDF scores can be rebuilt in the following steps:

1. **Launch MuseScore**

    ```bash
    musescore
    ```

    > **Note:**  
    > Messages such as `radeonsi: driver missing`, `glx: failed to create dri3 screen`, or `failed to load driver: radeonsi` may appear on launch. These warnings are expected and can be ignored if MuseScore opens and runs without crashing.

<!--    
    ================================================================================================
-->

2. **Export each score to PDF through the MuseScore GUI**

    For each piece under `composizioni/Op-1_No-*/`:

    1. Open `score.mscz`.

        > **Note:**  
        > Opening a score may print many FluidSynth lines of the form  
        > `SoundFont(.../MuseScore_General.sf3) Sample(...) fowled (broken soundfont?), fixing up`  
        > (often for pizzicato samples such as `BassPzz_*`, `CellPzz_*`, `ViolPzz_*`, `VlnsPzz_*`).  
        > These messages are expected and can be ignored if MuseScore opens and plays back without crashing.

    2. Choose **File -> Export**.
    3. Set **Export to** to **PDF file**.
    4. In the **What to export** block, check **Full Score**.
    5. In the **export options** block, set:

        | Setting | Value |
        |---|---|
        | Resolution | **360 DPI** |
        | Background | **Export with background present in score** |
        | Export each score | **Combined into a single file** |

    6. Save the output as `score.pdf` in the same piece directory.

<!--    
    ================================================================================================
-->

3. **Close MuseScore**

    Close the application via the window close button in the MuseScore GUI.

4. **Compile Typst title and copyright pages for every piece into `paratext.pdf`**

    ```bash
    pixi run paratext-all
    ```

5. **Merge `paratext.pdf` and `score.pdf` into `merged.pdf` for every piece**

    ```bash
    pixi run merge-all
    ```

6. **Create `release.pdf` from `merged.pdf` with release metadata for every piece**

    ```bash
    pixi run release-all
    ```

> **Want to see what happens under the hood?**  
> The Pixi tasks that drive this pipeline are defined here:
> - [Workspace tasks](./pixi.toml)
>
> Those tasks invoke the PDF pipeline CLIs. Every file is fully documented with detailed docstrings:
> - [Pipeline CLIs](./recipes/scripts/src/scripts/)

<!--    
    ================================================================================================
-->

## License

Each file in this repository is licensed under one of the following licenses:

- [Apache License, Version 2.0](LICENSES/Apache-2.0.txt),
- [Creative Commons Attribution 4.0 International Public License](LICENSES/CC-BY-4.0.txt),
- [Creative Commons CC0 1.0 Universal Public Domain Dedication](LICENSES/CC0-1.0.txt).

The applicable license is stated in the header comment of each file. 
See [LICENSE.txt](LICENSE.txt) for details.

<!--    
    ================================================================================================
-->
