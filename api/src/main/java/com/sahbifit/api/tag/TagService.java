// FILE: C:\Users\Ahmed\Desktop\sahbifit\api\src\main\java\com\sahbifit\api\tag\TagService.java
package com.sahbifit.api.tag;

import com.sahbifit.api.tag.model.Tag;
import com.sahbifit.api.tag.model.TagType;
import com.sahbifit.api.tag.repository.TagRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
@RequiredArgsConstructor
public class TagService {

    private final TagRepository tagRepository;

    public List<Tag> getTagsByType(TagType type) {
        return tagRepository.findByTagType(type);
    }
}