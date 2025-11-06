// Pfad: src/main/java/com/sahbifit/api/tag/model/Tag.java
package com.sahbifit.api.tag.model;

import com.sahbifit.api.model.enums.TagType;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;

import java.util.Set;

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
    @JdbcTypeCode(SqlTypes.NAMED_ENUM) // Wichtig für PostgreSQL ENUMs
    private TagType tagType;

    @OneToMany(mappedBy = "tag")
    private Set<UserTag> userTags;
}