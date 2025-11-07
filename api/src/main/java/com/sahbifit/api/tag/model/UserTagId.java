package com.sahbifit.api.tag.model;

import java.io.Serializable;
import java.util.UUID;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.Data;

@Data
@Embeddable
public class UserTagId implements Serializable {

    @Column(name = "user_id")
    private UUID userId;

    @Column(name = "tag_id")
    private Integer tagId;
}