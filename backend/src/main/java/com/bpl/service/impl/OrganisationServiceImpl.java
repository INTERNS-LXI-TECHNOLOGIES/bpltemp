package com.bpl.service.impl;

import com.bpl.domain.Organisation;
import com.bpl.repository.OrganisationRepository;
import com.bpl.service.OrganisationService;
import com.bpl.service.dto.OrganisationDTO;
import com.bpl.service.mapper.OrganisationMapper;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service Implementation for managing {@link com.bpl.domain.Organisation}.
 */
@Service
@Transactional
public class OrganisationServiceImpl implements OrganisationService {

    private static final Logger LOG = LoggerFactory.getLogger(OrganisationServiceImpl.class);

    private final OrganisationRepository organisationRepository;

    private final OrganisationMapper organisationMapper;

    public OrganisationServiceImpl(OrganisationRepository organisationRepository, OrganisationMapper organisationMapper) {
        this.organisationRepository = organisationRepository;
        this.organisationMapper = organisationMapper;
    }

    @Override
    public OrganisationDTO save(OrganisationDTO organisationDTO) {
        LOG.debug("Request to save Organisation : {}", organisationDTO);
        Organisation organisation = organisationMapper.toEntity(organisationDTO);
        organisation = organisationRepository.save(organisation);
        return organisationMapper.toDto(organisation);
    }

    @Override
    public OrganisationDTO update(OrganisationDTO organisationDTO) {
        LOG.debug("Request to update Organisation : {}", organisationDTO);
        Organisation organisation = organisationMapper.toEntity(organisationDTO);
        organisation = organisationRepository.save(organisation);
        return organisationMapper.toDto(organisation);
    }

    @Override
    public Optional<OrganisationDTO> partialUpdate(OrganisationDTO organisationDTO) {
        LOG.debug("Request to partially update Organisation : {}", organisationDTO);

        return organisationRepository
            .findById(organisationDTO.getId())
            .map(existingOrganisation -> {
                organisationMapper.partialUpdate(existingOrganisation, organisationDTO);

                return existingOrganisation;
            })
            .map(organisationRepository::save)
            .map(organisationMapper::toDto);
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<OrganisationDTO> findOne(Long id) {
        LOG.debug("Request to get Organisation : {}", id);
        return organisationRepository.findById(id).map(organisationMapper::toDto);
    }

    @Override
    public void delete(Long id) {
        LOG.debug("Request to delete Organisation : {}", id);
        organisationRepository.deleteById(id);
    }
}
