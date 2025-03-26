import { TestBed } from '@angular/core/testing';
import { HttpTestingController, provideHttpClientTesting } from '@angular/common/http/testing';
import { provideHttpClient } from '@angular/common/http';

import { IFacilityType } from '../facility-type.model';
import { sampleWithFullData, sampleWithNewData, sampleWithPartialData, sampleWithRequiredData } from '../facility-type.test-samples';

import { FacilityTypeService } from './facility-type.service';

const requireRestSample: IFacilityType = {
  ...sampleWithRequiredData,
};

describe('FacilityType Service', () => {
  let service: FacilityTypeService;
  let httpMock: HttpTestingController;
  let expectedResult: IFacilityType | IFacilityType[] | boolean | null;

  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [provideHttpClient(), provideHttpClientTesting()],
    });
    expectedResult = null;
    service = TestBed.inject(FacilityTypeService);
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

    it('should create a FacilityType', () => {
      const facilityType = { ...sampleWithNewData };
      const returnedFromService = { ...requireRestSample };
      const expected = { ...sampleWithRequiredData };

      service.create(facilityType).subscribe(resp => (expectedResult = resp.body));

      const req = httpMock.expectOne({ method: 'POST' });
      req.flush(returnedFromService);
      expect(expectedResult).toMatchObject(expected);
    });

    it('should update a FacilityType', () => {
      const facilityType = { ...sampleWithRequiredData };
      const returnedFromService = { ...requireRestSample };
      const expected = { ...sampleWithRequiredData };

      service.update(facilityType).subscribe(resp => (expectedResult = resp.body));

      const req = httpMock.expectOne({ method: 'PUT' });
      req.flush(returnedFromService);
      expect(expectedResult).toMatchObject(expected);
    });

    it('should partial update a FacilityType', () => {
      const patchObject = { ...sampleWithPartialData };
      const returnedFromService = { ...requireRestSample };
      const expected = { ...sampleWithRequiredData };

      service.partialUpdate(patchObject).subscribe(resp => (expectedResult = resp.body));

      const req = httpMock.expectOne({ method: 'PATCH' });
      req.flush(returnedFromService);
      expect(expectedResult).toMatchObject(expected);
    });

    it('should return a list of FacilityType', () => {
      const returnedFromService = { ...requireRestSample };

      const expected = { ...sampleWithRequiredData };

      service.query().subscribe(resp => (expectedResult = resp.body));

      const req = httpMock.expectOne({ method: 'GET' });
      req.flush([returnedFromService]);
      httpMock.verify();
      expect(expectedResult).toMatchObject([expected]);
    });

    it('should delete a FacilityType', () => {
      const expected = true;

      service.delete(123).subscribe(resp => (expectedResult = resp.ok));

      const req = httpMock.expectOne({ method: 'DELETE' });
      req.flush({ status: 200 });
      expect(expectedResult).toBe(expected);
    });

    describe('addFacilityTypeToCollectionIfMissing', () => {
      it('should add a FacilityType to an empty array', () => {
        const facilityType: IFacilityType = sampleWithRequiredData;
        expectedResult = service.addFacilityTypeToCollectionIfMissing([], facilityType);
        expect(expectedResult).toHaveLength(1);
        expect(expectedResult).toContain(facilityType);
      });

      it('should not add a FacilityType to an array that contains it', () => {
        const facilityType: IFacilityType = sampleWithRequiredData;
        const facilityTypeCollection: IFacilityType[] = [
          {
            ...facilityType,
          },
          sampleWithPartialData,
        ];
        expectedResult = service.addFacilityTypeToCollectionIfMissing(facilityTypeCollection, facilityType);
        expect(expectedResult).toHaveLength(2);
      });

      it("should add a FacilityType to an array that doesn't contain it", () => {
        const facilityType: IFacilityType = sampleWithRequiredData;
        const facilityTypeCollection: IFacilityType[] = [sampleWithPartialData];
        expectedResult = service.addFacilityTypeToCollectionIfMissing(facilityTypeCollection, facilityType);
        expect(expectedResult).toHaveLength(2);
        expect(expectedResult).toContain(facilityType);
      });

      it('should add only unique FacilityType to an array', () => {
        const facilityTypeArray: IFacilityType[] = [sampleWithRequiredData, sampleWithPartialData, sampleWithFullData];
        const facilityTypeCollection: IFacilityType[] = [sampleWithRequiredData];
        expectedResult = service.addFacilityTypeToCollectionIfMissing(facilityTypeCollection, ...facilityTypeArray);
        expect(expectedResult).toHaveLength(3);
      });

      it('should accept varargs', () => {
        const facilityType: IFacilityType = sampleWithRequiredData;
        const facilityType2: IFacilityType = sampleWithPartialData;
        expectedResult = service.addFacilityTypeToCollectionIfMissing([], facilityType, facilityType2);
        expect(expectedResult).toHaveLength(2);
        expect(expectedResult).toContain(facilityType);
        expect(expectedResult).toContain(facilityType2);
      });

      it('should accept null and undefined values', () => {
        const facilityType: IFacilityType = sampleWithRequiredData;
        expectedResult = service.addFacilityTypeToCollectionIfMissing([], null, facilityType, undefined);
        expect(expectedResult).toHaveLength(1);
        expect(expectedResult).toContain(facilityType);
      });

      it('should return initial array if no FacilityType is added', () => {
        const facilityTypeCollection: IFacilityType[] = [sampleWithRequiredData];
        expectedResult = service.addFacilityTypeToCollectionIfMissing(facilityTypeCollection, undefined, null);
        expect(expectedResult).toEqual(facilityTypeCollection);
      });
    });

    describe('compareFacilityType', () => {
      it('Should return true if both entities are null', () => {
        const entity1 = null;
        const entity2 = null;

        const compareResult = service.compareFacilityType(entity1, entity2);

        expect(compareResult).toEqual(true);
      });

      it('Should return false if one entity is null', () => {
        const entity1 = { id: 18255 };
        const entity2 = null;

        const compareResult1 = service.compareFacilityType(entity1, entity2);
        const compareResult2 = service.compareFacilityType(entity2, entity1);

        expect(compareResult1).toEqual(false);
        expect(compareResult2).toEqual(false);
      });

      it('Should return false if primaryKey differs', () => {
        const entity1 = { id: 18255 };
        const entity2 = { id: 4814 };

        const compareResult1 = service.compareFacilityType(entity1, entity2);
        const compareResult2 = service.compareFacilityType(entity2, entity1);

        expect(compareResult1).toEqual(false);
        expect(compareResult2).toEqual(false);
      });

      it('Should return false if primaryKey matches', () => {
        const entity1 = { id: 18255 };
        const entity2 = { id: 18255 };

        const compareResult1 = service.compareFacilityType(entity1, entity2);
        const compareResult2 = service.compareFacilityType(entity2, entity1);

        expect(compareResult1).toEqual(true);
        expect(compareResult2).toEqual(true);
      });
    });
  });

  afterEach(() => {
    httpMock.verify();
  });
});
