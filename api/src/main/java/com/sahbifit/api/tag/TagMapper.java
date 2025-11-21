package com.sahbifit.api.tag;

import com.sahbifit.api.tag.dto.TagDto;
import com.sahbifit.api.tag.model.Tag;

import java.util.List;
import java.util.stream.Collectors;

public class TagMapper {

    public static TagDto toDto(Tag tag) {
        if (tag == null) {
            return null;
        }

        return new TagDto(
            tag.getTagId(),
            tag.getTagName(),
            tag.getTagType()
        );
    }

    public static List<TagDto> toDtoList(List<Tag> tags) {
        return tags.stream()
            .map(TagMapper::toDto)
            .collect(Collectors.toList());
    }
}