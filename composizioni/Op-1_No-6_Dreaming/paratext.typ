// =================================================================================================
//
// Copyright (c) 2026 Ilya Snegov (aka Sierra Arn)
//
// Dedicated to the public domain under the Creative Commons
// CC0 1.0 Universal Public Domain Dedication (the "Dedication").
// You may obtain a copy of the Dedication at
//
// https://creativecommons.org/publicdomain/zero/1.0/legalcode.en
//
// =================================================================================================
// composizioni/Op-1_No-6_Dreaming/paratext.typ
// =================================================================================================

#import "../paratext/lib.typ": paratext

/// **Description:**
///
/// Defines the entry point for generating the paratext of a musical work.
///
/// Calls `paratext` with the work's number, title, and instrument designation
/// to generate the title page and copyright page in a single invocation.
///
/// Allows the document to be compiled directly from the terminal using
/// the `typst compile` command.
#paratext(
    number: 6,
    title: "Dreaming",
    instruments: [Harp],
)

// =================================================================================================
