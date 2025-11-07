package com.sahbifit.api.tag.model;

import com.sahbifit.api.user.model.User;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Index;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "user_tags", indexes = { // <-- ADD THIS BLOCK
    @Index(name = "idx_usertag_user", columnList = "user_id"),
    @Index(name = "idx_usertag_tag", columnList = "tag_id")
})
public class UserTag {

    @EmbeddedId
    private UserTagId id;

    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("userId")
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("tagId")
    @JoinColumn(name = "tag_id")
    private Tag tag;
}