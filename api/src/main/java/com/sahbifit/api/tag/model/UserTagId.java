// Pfad: src/main/java/com/sahbifit/api/tag/model/UserTagId.java
package com.sahbifit.api.tag.model;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.Data;

import java.io.Serializable;
import java.util.UUID;

@Data
@Embeddable
public class UserTagId implements Serializable {

    @Column(name = "user_id")
    private UUID userId;

    @Column(name = "tag_id")
    private Integer tagId;
}