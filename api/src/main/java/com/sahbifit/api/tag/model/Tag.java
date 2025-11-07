package com.sahbifit.api.tag.model;

import java.util.Set;

import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "tags")
public class Tag {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "tag_id")
    private Integer tagId;

    @Column(name = "tag_name", nullable = false, unique = true, length = 100)
    private String tagName;

    @Enumerated(EnumType.STRING)
    @Column(name = "tag_type", nullable = false, columnDefinition = "tag_type")
    @JdbcTypeCode(SqlTypes.NAMED_ENUM) 
    private TagType tagType;

    @OneToMany(mappedBy = "tag")
    private Set<UserTag> userTags;
}