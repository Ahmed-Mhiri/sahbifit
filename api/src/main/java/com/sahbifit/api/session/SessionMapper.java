package com.sahbifit.api.session;

import com.sahbifit.api.gym.GymMapper;
import com.sahbifit.api.session.dto.SessionFeedDto;
import com.sahbifit.api.session.model.Session;
import com.sahbifit.api.user.UserMapper;

import java.util.List;
import java.util.stream.Collectors;

/**
 * Handles mapping between Session entities and Session DTOs.
 */
public class SessionMapper {

    /**
     * Converts a Session @Entity to a SessionFeedDto.
     * This uses other mappers (UserMapper, GymMapper) to build
     * a safe, nested DTO.
     */
    public static SessionFeedDto toFeedDto(Session session) {
        if (session == null) {
            return null;
        }

        return new SessionFeedDto(
            session.getSessionId(),
            session.getTitle(),
            session.getStartTime(),
            session.getEndTime(),
            session.getSessionType(),
            session.getParticipantCount(), // Uses the @Formula field
            session.getMaxParticipants(),
            UserMapper.toSummaryDto(session.getCreator()), // Use UserMapper
            GymMapper.toDto(session.getGym()),             // Use GymMapper
            session.isChatActive()
        );
    }

    /**
     * Helper to convert a list of entities to a list of DTOs.
     */
    public static List<SessionFeedDto> toFeedDtoList(List<Session> sessions) {
        return sessions.stream()
            .map(SessionMapper::toFeedDto)
            .collect(Collectors.toList());
    }
}