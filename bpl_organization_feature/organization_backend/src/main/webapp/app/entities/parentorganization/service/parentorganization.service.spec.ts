import { TestBed } from '@angular/core/testing';
import { HttpTestingController, provideHttpClientTesting } from '@angular/common/http/testing';
import { provideHttpClient } from '@angular/common/http';

import { IParentorganization } from '../parentorganization.model';
import { sampleWithFullData, sampleWithNewData, sampleWithPartialData, sampleWithRequiredData } from '../parentorganization.test-samples';

import { ParentorganizationService } from './parentorganization.service';

const requireRestSample: IParentorganization = {
  ...sampleWithRequiredData,
};

describe('Parentorganization Service', () => {
  let service: ParentorganizationService;
  let httpMock: HttpTestingController;
  let expectedResult: IParentorganization | IParentorganization[] | boolean | null;

  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [provideHttpClient(), provideHttpClientTesting()],
    });
    expectedResult = null;
    service = TestBed.inject(ParentorganizationService);
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

    it('should create a Parentorganization', () => {
      const parentorganization = { ...sampleWithNewData };
      const returnedFromService = { ...requireRestSample };
      const expected = { ...sampleWithRequiredData };

      service.create(parentorganization).subscribe(resp => (expectedResult = resp.body));

      const req = httpMock.expectOne({ method: 'POST' });
      req.flush(returnedFromService);
      expect(expectedResult).toMatchObject(expected);
    });

    it('should update a Parentorganization', () => {
      const parentorganization = { ...sampleWithRequiredData };
      const returnedFromService = { ...requireRestSample };
      const expected = { ...sampleWithRequiredData };

      service.update(parentorganization).subscribe(resp => (expectedResult = resp.body));

      const req = httpMock.expectOne({ method: 'PUT' });
      req.flush(returnedFromService);
      expect(expectedResult).toMatchObject(expected);
    });

    it('should partial update a Parentorganization', () => {
      const patchObject = { ...sampleWithPartialData };
      const returnedFromService = { ...requireRestSample };
      const expected = { ...sampleWithRequiredData };

      service.partialUpdate(patchObject).subscribe(resp => (expectedResult = resp.body));

      const req = httpMock.expectOne({ method: 'PATCH' });
      req.flush(returnedFromService);
      expect(expectedResult).toMatchObject(expected);
    });

    it('should return a list of Parentorganization', () => {
      const returnedFromService = { ...requireRestSample };

      const expected = { ...sampleWithRequiredData };

      service.query().subscribe(resp => (expectedResult = resp.body));

      const req = httpMock.expectOne({ method: 'GET' });
      req.flush([returnedFromService]);
      httpMock.verify();
      expect(expectedResult).toMatchObject([expected]);
    });

    it('should delete a Parentorganization', () => {
      const expected = true;

      service.delete(123).subscribe(resp => (expectedResult = resp.ok));

      const req = httpMock.expectOne({ method: 'DELETE' });
      req.flush({ status: 200 });
      expect(expectedResult).toBe(expected);
    });

    describe('addParentorganizationToCollectionIfMissing', () => {
      it('should add a Parentorganization to an empty array', () => {
        const parentorganization: IParentorganization = sampleWithRequiredData;
        expectedResult = service.addParentorganizationToCollectionIfMissing([], parentorganization);
        expect(expectedResult).toHaveLength(1);
        expect(expectedResult).toContain(parentorganization);
      });

      it('should not add a Parentorganization to an array that contains it', () => {
        const parentorganization: IParentorganization = sampleWithRequiredData;
        const parentorganizationCollection: IParentorganization[] = [
          {
            ...parentorganization,
          },
          sampleWithPartialData,
        ];
        expectedResult = service.addParentorganizationToCollectionIfMissing(parentorganizationCollection, parentorganization);
        expect(expectedResult).toHaveLength(2);
      });

      it("should add a Parentorganization to an array that doesn't contain it", () => {
        const parentorganization: IParentorganization = sampleWithRequiredData;
        const parentorganizationCollection: IParentorganization[] = [sampleWithPartialData];
        expectedResult = service.addParentorganizationToCollectionIfMissing(parentorganizationCollection, parentorganization);
        expect(expectedResult).toHaveLength(2);
        expect(expectedResult).toContain(parentorganization);
      });

      it('should add only unique Parentorganization to an array', () => {
        const parentorganizationArray: IParentorganization[] = [sampleWithRequiredData, sampleWithPartialData, sampleWithFullData];
        const parentorganizationCollection: IParentorganization[] = [sampleWithRequiredData];
        expectedResult = service.addParentorganizationToCollectionIfMissing(parentorganizationCollection, ...parentorganizationArray);
        expect(expectedResult).toHaveLength(3);
      });

      it('should accept varargs', () => {
        const parentorganization: IParentorganization = sampleWithRequiredData;
        const parentorganization2: IParentorganization = sampleWithPartialData;
        expectedResult = service.addParentorganizationToCollectionIfMissing([], parentorganization, parentorganization2);
        expect(expectedResult).toHaveLength(2);
        expect(expectedResult).toContain(parentorganization);
        expect(expectedResult).toContain(parentorganization2);
      });

      it('should accept null and undefined values', () => {
        const parentorganization: IParentorganization = sampleWithRequiredData;
        expectedResult = service.addParentorganizationToCollectionIfMissing([], null, parentorganization, undefined);
        expect(expectedResult).toHaveLength(1);
        expect(expectedResult).toContain(parentorganization);
      });

      it('should return initial array if no Parentorganization is added', () => {
        const parentorganizationCollection: IParentorganization[] = [sampleWithRequiredData];
        expectedResult = service.addParentorganizationToCollectionIfMissing(parentorganizationCollection, undefined, null);
        expect(expectedResult).toEqual(parentorganizationCollection);
      });
    });

    describe('compareParentorganization', () => {
      it('Should return true if both entities are null', () => {
        const entity1 = null;
        const entity2 = null;

        const compareResult = service.compareParentorganization(entity1, entity2);

        expect(compareResult).toEqual(true);
      });

      it('Should return false if one entity is null', () => {
        const entity1 = { id: 4781 };
        const entity2 = null;

        const compareResult1 = service.compareParentorganization(entity1, entity2);
        const compareResult2 = service.compareParentorganization(entity2, entity1);

        expect(compareResult1).toEqual(false);
        expect(compareResult2).toEqual(false);
      });

      it('Should return false if primaryKey differs', () => {
        const entity1 = { id: 4781 };
        const entity2 = { id: 22935 };

        const compareResult1 = service.compareParentorganization(entity1, entity2);
        const compareResult2 = service.compareParentorganization(entity2, entity1);

        expect(compareResult1).toEqual(false);
        expect(compareResult2).toEqual(false);
      });

      it('Should return false if primaryKey matches', () => {
        const entity1 = { id: 4781 };
        const entity2 = { id: 4781 };

        const compareResult1 = service.compareParentorganization(entity1, entity2);
        const compareResult2 = service.compareParentorganization(entity2, entity1);

        expect(compareResult1).toEqual(true);
        expect(compareResult2).toEqual(true);
      });
    });
  });

  afterEach(() => {
    httpMock.verify();
  });
});
