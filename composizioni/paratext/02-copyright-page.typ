// =================================================================================================
//
// Copyright (c) 2026 Ilya Snegov (aka Sierra Arn)
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// =================================================================================================
// composizioni/paratext/02-copyright-page.typ
// =================================================================================================

/// **Description:**
///
/// Generates a standalone copyright page.
///
/// Displays the copyright notice, including the copyright symbol,
/// year, legal name of the rights holder, and author's name, centered
/// horizontally and vertically on the page.
///
/// Below the copyright notice, displays the license name, designation,
/// and URL, followed by contact information for obtaining permissions
/// beyond the scope of the license.
///
/// Uses a smaller font size and increased paragraph leading to maintain
/// a compact, readable layout, with vertical spacing between each section.
///
/// **Parameters:**
/// - `year`: `content` or `none` (the year of copyright).
/// - `author`: `content` or `none` (the author's name or pseudonym).
/// - `legal-name`: `content` or `none` (the legal name of the rights holder).
/// - `email`: `content` or `none` (the email address for permissions inquiries).
/// - `license-name`: `content` or `none` (the full name of the license under which the work is distributed).
/// - `license-designation`: `content` or `none` (the license's abbreviation or designation).
/// - `license-url`: `content` or `none` (the URL linking to the license terms).
#let copyright-page(
    year: none,
    author: none,
    legal-name: none,
    email: none,
    license-name: none,
    license-designation: none,
    license-url: none,
) = {
    page(
        {
            set text(size: 0.85em)
            set par(leading: 1.12em)

            align(center + horizon)[
                #sym.copyright #year #legal-name (aka #author)

                #v(1.25em, weak: false)

                This work is licensed under the \
                #license-name \
                (#license-designation). \
                #link(license-url)

                #v(1.25em, weak: false)

                For permissions beyond the scope of this license, \
                contact the rights holder: \
                #link("mailto:" + email, email)
            ]
        },
    )
}

// =================================================================================================
