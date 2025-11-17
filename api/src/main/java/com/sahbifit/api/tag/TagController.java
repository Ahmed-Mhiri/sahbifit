// FILE: C:\Users\Ahmed\Desktop\sahbifit\api\src\main\java\com\sahbifit\api\tag\TagController.java
package com.sahbifit.api.tag;

import com.sahbifit.api.tag.model.Tag;
import com.sahbifit.api.tag.model.TagType;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/tags")
@RequiredArgsConstructor
public class TagController {

    private final TagService tagService;

    @GetMapping
    public ResponseEntity<List<Tag>> getTags(
        @RequestParam(name = "type") TagType type
    ) {
        List<Tag> tags = tagService.getTagsByType(type);
        return ResponseEntity.ok(tags);
    }
}