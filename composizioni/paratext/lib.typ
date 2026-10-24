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
// composizioni/paratext/lib.typ
// =================================================================================================

#import "01-title-page.typ": title-page
#import "02-copyright-page.typ": copyright-page

#let meta = toml("../../metadata.toml")

/// **Description:**
///
/// Generates the paratext pages for a musical work, including a title page
/// and a copyright page.
///
/// Configures the document's page layout, typography, and metadata, using
/// A4 paper, 2.5 cm margins, the Libertinus Serif font, and English as
/// the document language.
///
/// Constructs a `datetime` value from the date specified in the document
/// metadata and sets the document title, author, and date.
///
/// Generates a title page displaying the work's collection, number, title,
/// instrument designation, author, and date. Generates a copyright page
/// displaying the copyright notice, license information, and contact details
/// for permissions inquiries.
///
/// **Parameters:**
/// - `number`: `content` or `none` (the number of the musical work within the collection).
/// - `title`: `content` or `none` (the title of the musical work).
/// - `instruments`: `content` or `none` (the instrument or instruments for which the work is written).
/// - `author`: `content` (the author's name or pseudonym, defaulting to `meta.author.display_name`).
/// - `legal-name`: `content` (the legal name of the rights holder, defaulting to `meta.author.legal_name`).
/// - `collection`: `content` (the opus designation to which the work belongs, defaulting to `meta.work.collection`).
#let paratext(
    number: none,
    title: none,
    instruments: none,
    author: meta.author.display_name,
    legal-name: meta.author.legal_name,
    collection: meta.work.collection,
) = {
    set page(
        paper: "a4",
        margin: (top: 2.5cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm),
    )

    set text(
        font: "Libertinus Serif",
        size: 12pt,
        lang: "en",
    )

    let date = datetime(
        year: meta.date.year,
        month: meta.date.month,
        day: meta.date.day,
    )

    set document(
        title: [No. #number: #title],
        author: author,
        date: date,
    )

    title-page(
        collection: collection,
        number: number,
        title: title,
        instruments: instruments,
        author: author,
        date: date,
    )

    copyright-page(
        year: date.year(),
        author: author,
        legal-name: legal-name,
        email: meta.author.email,
        license-name: meta.license.name,
        license-designation: meta.license.designation,
        license-url: meta.license.url,
    )
}

// =================================================================================================
