package com.sahbifit.api.tag.dto;

import com.sahbifit.api.tag.model.TagType;

/**
 * A safe, flat DTO for representing a Tag.
 * This prevents exposing any entity relationships.
 */
public record TagDto(
    Integer tagId,
    String tagName,
    TagType tagType
) {}