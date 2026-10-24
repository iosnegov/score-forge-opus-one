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
// composizioni/paratext/01-title-page.typ
// =================================================================================================

/// **Description:**
///
/// Generates a standalone title page for a musical work.
///
/// Places the collection name, work number and title, instrument
/// designation, author, and date inside a block occupying 90%
/// of the page width. Vertically centers the block and aligns it to the left.
///
/// Displays the collection name first, followed by the work number
/// and title in a large, bold font. The instrument designation is displayed
/// in an italic font, followed by the author's name and the formatted date,
/// with vertical spacing between each element.
///
/// **Parameters:**
/// - `collection`: `content` or `none` (the opus designation to which the work belongs).
/// - `number`: `content` or `none` (the number of the musical work within the collection).
/// - `title`: `content` or `none` (the title of the musical work).
/// - `instruments`: `content` or `none` (the instrument or instruments for which the work is written).
/// - `author`: `content` or `none` (the name of the author or composer).
/// - `date`: `datetime` or `none` (the date displayed on the title page).
#let title-page(
    collection: none,
    number: none,
    title: none,
    instruments: none,
    author: none,
    date: none,
) = {
    page(
        align(
            left + horizon,
            block(width: 90%)[
                #text(size: 1.75em, collection)

                #v(2.5em, weak: true)

                #text(size: 2.75em, strong([No. #number: #title]))

                #v(1.5em, weak: true)

                #text(size: 1.35em, emph([for #instruments]))

                #v(2em, weak: true)

                #text(size: 1.5em, author)

                #v(2em, weak: true)

                #text(size: 1em, date.display("[day] [month repr:long] [year]"))
            ],
        ),
    )
}

// =================================================================================================
