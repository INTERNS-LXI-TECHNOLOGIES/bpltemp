package com.lxisoft.organizationbackend.repository;

import com.lxisoft.organizationbackend.domain.Organization;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import java.util.stream.IntStream;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;

/**
 * Utility repository to load bag relationships based on https://vladmihalcea.com/hibernate-multiplebagfetchexception/
 */
public class OrganizationRepositoryWithBagRelationshipsImpl implements OrganizationRepositoryWithBagRelationships {

    private static final String ID_PARAMETER = "id";
    private static final String ORGANIZATIONS_PARAMETER = "organizations";

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Optional<Organization> fetchBagRelationships(Optional<Organization> organization) {
        return organization.map(this::fetchRelatedOrganizations);
    }

    @Override
    public Page<Organization> fetchBagRelationships(Page<Organization> organizations) {
        return new PageImpl<>(
            fetchBagRelationships(organizations.getContent()),
            organizations.getPageable(),
            organizations.getTotalElements()
        );
    }

    @Override
    public List<Organization> fetchBagRelationships(List<Organization> organizations) {
        return Optional.of(organizations).map(this::fetchRelatedOrganizations).orElse(Collections.emptyList());
    }

    Organization fetchRelatedOrganizations(Organization result) {
        return entityManager
            .createQuery(
                "select organization from Organization organization left join fetch organization.relatedOrganizations where organization.id = :id",
                Organization.class
            )
            .setParameter(ID_PARAMETER, result.getId())
            .getSingleResult();
    }

    List<Organization> fetchRelatedOrganizations(List<Organization> organizations) {
        HashMap<Object, Integer> order = new HashMap<>();
        IntStream.range(0, organizations.size()).forEach(index -> order.put(organizations.get(index).getId(), index));
        List<Organization> result = entityManager
            .createQuery(
                "select organization from Organization organization left join fetch organization.relatedOrganizations where organization in :organizations",
                Organization.class
            )
            .setParameter(ORGANIZATIONS_PARAMETER, organizations)
            .getResultList();
        Collections.sort(result, (o1, o2) -> Integer.compare(order.get(o1.getId()), order.get(o2.getId())));
        return result;
    }
}
