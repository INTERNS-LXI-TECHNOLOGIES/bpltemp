import { TestBed } from '@angular/core/testing';
import { HttpTestingController, provideHttpClientTesting } from '@angular/common/http/testing';
import { provideHttpClient } from '@angular/common/http';

import { IParentOrganization } from '../parent-organization.model';
import { sampleWithFullData, sampleWithNewData, sampleWithPartialData, sampleWithRequiredData } from '../parent-organization.test-samples';

import { ParentOrganizationService } from './parent-organization.service';

const requireRestSample: IParentOrganization = {
  ...sampleWithRequiredData,
};

describe('ParentOrganization Service', () => {
  let service: ParentOrganizationService;
  let httpMock: HttpTestingController;
  let expectedResult: IParentOrganization | IParentOrganization[] | boolean | null;

  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [provideHttpClient(), provideHttpClientTesting()],
    });
    expectedResult = null;
    service = TestBed.inject(ParentOrganizationService);
    httpMock = TestBed.inject(HttpTestingController);
  });

  describe('Service methods', () => {
    it('should find an element', () => {
      const returnedFromService = { ...requireRestSample };
      const expected = { ...sampleWithRequiredData };

      service.find(123).subscribe(resp => (expectedResult = resp.body));

      const req = httpMock.expectOne({ method: 'GET' });
      req.flush(returnedFromService);
      expect(expectedResult).toMatchObject(expected);
    });

    it('should create a ParentOrganization', () => {
      const parentOrganization = { ...sampleWithNewData };
      const returnedFromService = { ...requireRestSample };
      const expected = { ...sampleWithRequiredData };

      service.create(parentOrganization).subscribe(resp => (expectedResult = resp.body));

      const req = httpMock.expectOne({ method: 'POST' });
      req.flush(returnedFromService);
      expect(expectedResult).toMatchObject(expected);
    });

    it('should update a ParentOrganization', () => {
      const parentOrganization = { ...sampleWithRequiredData };
      const returnedFromService = { ...requireRestSample };
      const expected = { ...sampleWithRequiredData };

      service.update(parentOrganization).subscribe(resp => (expectedResult = resp.body));

      const req = httpMock.expectOne({ method: 'PUT' });
      req.flush(returnedFromService);
      expect(expectedResult).toMatchObject(expected);
    });

    it('should partial update a ParentOrganization', () => {
      const patchObject = { ...sampleWithPartialData };
      const returnedFromService = { ...requireRestSample };
      const expected = { ...sampleWithRequiredData };

      service.partialUpdate(patchObject).subscribe(resp => (expectedResult = resp.body));

      const req = httpMock.expectOne({ method: 'PATCH' });
      req.flush(returnedFromService);
      expect(expectedResult).toMatchObject(expected);
    });

    it('should return a list of ParentOrganization', () => {
      const returnedFromService = { ...requireRestSample };

      const expected = { ...sampleWithRequiredData };

      service.query().subscribe(resp => (expectedResult = resp.body));

      const req = httpMock.expectOne({ method: 'GET' });
      req.flush([returnedFromService]);
      httpMock.verify();
      expect(expectedResult).toMatchObject([expected]);
    });

    it('should delete a ParentOrganization', () => {
      const expected = true;

      service.delete(123).subscribe(resp => (expectedResult = resp.ok));

      const req = httpMock.expectOne({ method: 'DELETE' });
      req.flush({ status: 200 });
      expect(expectedResult).toBe(expected);
    });

    describe('addParentOrganizationToCollectionIfMissing', () => {
      it('should add a ParentOrganization to an empty array', () => {
        const parentOrganization: IParentOrganization = sampleWithRequiredData;
        expectedResult = service.addParentOrganizationToCollectionIfMissing([], parentOrganization);
        expect(expectedResult).toHaveLength(1);
        expect(expectedResult).toContain(parentOrganization);
      });

      it('should not add a ParentOrganization to an array that contains it', () => {
        const parentOrganization: IParentOrganization = sampleWithRequiredData;
        const parentOrganizationCollection: IParentOrganization[] = [
          {
            ...parentOrganization,
          },
          sampleWithPartialData,
        ];
        expectedResult = service.addParentOrganizationToCollectionIfMissing(parentOrganizationCollection, parentOrganization);
        expect(expectedResult).toHaveLength(2);
      });

      it("should add a ParentOrganization to an array that doesn't contain it", () => {
        const parentOrganization: IParentOrganization = sampleWithRequiredData;
        const parentOrganizationCollection: IParentOrganization[] = [sampleWithPartialData];
        expectedResult = service.addParentOrganizationToCollectionIfMissing(parentOrganizationCollection, parentOrganization);
        expect(expectedResult).toHaveLength(2);
        expect(expectedResult).toContain(parentOrganization);
      });

      it('should add only unique ParentOrganization to an array', () => {
        const parentOrganizationArray: IParentOrganization[] = [sampleWithRequiredData, sampleWithPartialData, sampleWithFullData];
        const parentOrganizationCollection: IParentOrganization[] = [sampleWithRequiredData];
        expectedResult = service.addParentOrganizationToCollectionIfMissing(parentOrganizationCollection, ...parentOrganizationArray);
        expect(expectedResult).toHaveLength(3);
      });

      it('should accept varargs', () => {
        const parentOrganization: IParentOrganization = sampleWithRequiredData;
        const parentOrganization2: IParentOrganization = sampleWithPartialData;
        expectedResult = service.addParentOrganizationToCollectionIfMissing([], parentOrganization, parentOrganization2);
        expect(expectedResult).toHaveLength(2);
        expect(expectedResult).toContain(parentOrganization);
        expect(expectedResult).toContain(parentOrganization2);
      });

      it('should accept null and undefined values', () => {
        const parentOrganization: IParentOrganization = sampleWithRequiredData;
        expectedResult = service.addParentOrganizationToCollectionIfMissing([], null, parentOrganization, undefined);
        expect(expectedResult).toHaveLength(1);
        expect(expectedResult).toContain(parentOrganization);
      });

      it('should return initial array if no ParentOrganization is added', () => {
        const parentOrganizationCollection: IParentOrganization[] = [sampleWithRequiredData];
        expectedResult = service.addParentOrganizationToCollectionIfMissing(parentOrganizationCollection, undefined, null);
        expect(expectedResult).toEqual(parentOrganizationCollection);
      });
    });

    describe('compareParentOrganization', () => {
      it('Should return true if both entities are null', () => {
        const entity1 = null;
        const entity2 = null;

        const compareResult = service.compareParentOrganization(entity1, entity2);

        expect(compareResult).toEqual(true);
      });

      it('Should return false if one entity is null', () => {
        const entity1 = { id: 4781 };
        const entity2 = null;

        const compareResult1 = service.compareParentOrganization(entity1, entity2);
        const compareResult2 = service.compareParentOrganization(entity2, entity1);

        expect(compareResult1).toEqual(false);
        expect(compareResult2).toEqual(false);
      });

      it('Should return false if primaryKey differs', () => {
        const entity1 = { id: 4781 };
        const entity2 = { id: 22935 };

        const compareResult1 = service.compareParentOrganization(entity1, entity2);
        const compareResult2 = service.compareParentOrganization(entity2, entity1);

        expect(compareResult1).toEqual(false);
        expect(compareResult2).toEqual(false);
      });

      it('Should return false if primaryKey matches', () => {
        const entity1 = { id: 4781 };
        const entity2 = { id: 4781 };

        const compareResult1 = service.compareParentOrganization(entity1, entity2);
        const compareResult2 = service.compareParentOrganization(entity2, entity1);

        expect(compareResult1).toEqual(true);
        expect(compareResult2).toEqual(true);
      });
    });
  });

  afterEach(() => {
    httpMock.verify();
  });
});
