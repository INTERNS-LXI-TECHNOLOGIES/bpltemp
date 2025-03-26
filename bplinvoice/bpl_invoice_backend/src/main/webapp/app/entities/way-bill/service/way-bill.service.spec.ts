import { TestBed } from '@angular/core/testing';
import { HttpTestingController, provideHttpClientTesting } from '@angular/common/http/testing';
import { provideHttpClient } from '@angular/common/http';

import { IWayBill } from '../way-bill.model';
import { sampleWithFullData, sampleWithNewData, sampleWithPartialData, sampleWithRequiredData } from '../way-bill.test-samples';

import { RestWayBill, WayBillService } from './way-bill.service';

const requireRestSample: RestWayBill = {
  ...sampleWithRequiredData,
  estimatedReadyDate: sampleWithRequiredData.estimatedReadyDate?.toJSON(),
  estimatedShipDate: sampleWithRequiredData.estimatedShipDate?.toJSON(),
};

describe('WayBill Service', () => {
  let service: WayBillService;
  let httpMock: HttpTestingController;
  let expectedResult: IWayBill | IWayBill[] | boolean | null;

  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [provideHttpClient(), provideHttpClientTesting()],
    });
    expectedResult = null;
    service = TestBed.inject(WayBillService);
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

    it('should create a WayBill', () => {
      const wayBill = { ...sampleWithNewData };
      const returnedFromService = { ...requireRestSample };
      const expected = { ...sampleWithRequiredData };

      service.create(wayBill).subscribe(resp => (expectedResult = resp.body));

      const req = httpMock.expectOne({ method: 'POST' });
      req.flush(returnedFromService);
      expect(expectedResult).toMatchObject(expected);
    });

    it('should update a WayBill', () => {
      const wayBill = { ...sampleWithRequiredData };
      const returnedFromService = { ...requireRestSample };
      const expected = { ...sampleWithRequiredData };

      service.update(wayBill).subscribe(resp => (expectedResult = resp.body));

      const req = httpMock.expectOne({ method: 'PUT' });
      req.flush(returnedFromService);
      expect(expectedResult).toMatchObject(expected);
    });

    it('should partial update a WayBill', () => {
      const patchObject = { ...sampleWithPartialData };
      const returnedFromService = { ...requireRestSample };
      const expected = { ...sampleWithRequiredData };

      service.partialUpdate(patchObject).subscribe(resp => (expectedResult = resp.body));

      const req = httpMock.expectOne({ method: 'PATCH' });
      req.flush(returnedFromService);
      expect(expectedResult).toMatchObject(expected);
    });

    it('should return a list of WayBill', () => {
      const returnedFromService = { ...requireRestSample };

      const expected = { ...sampleWithRequiredData };

      service.query().subscribe(resp => (expectedResult = resp.body));

      const req = httpMock.expectOne({ method: 'GET' });
      req.flush([returnedFromService]);
      httpMock.verify();
      expect(expectedResult).toMatchObject([expected]);
    });

    it('should delete a WayBill', () => {
      const expected = true;

      service.delete(123).subscribe(resp => (expectedResult = resp.ok));

      const req = httpMock.expectOne({ method: 'DELETE' });
      req.flush({ status: 200 });
      expect(expectedResult).toBe(expected);
    });

    describe('addWayBillToCollectionIfMissing', () => {
      it('should add a WayBill to an empty array', () => {
        const wayBill: IWayBill = sampleWithRequiredData;
        expectedResult = service.addWayBillToCollectionIfMissing([], wayBill);
        expect(expectedResult).toHaveLength(1);
        expect(expectedResult).toContain(wayBill);
      });

      it('should not add a WayBill to an array that contains it', () => {
        const wayBill: IWayBill = sampleWithRequiredData;
        const wayBillCollection: IWayBill[] = [
          {
            ...wayBill,
          },
          sampleWithPartialData,
        ];
        expectedResult = service.addWayBillToCollectionIfMissing(wayBillCollection, wayBill);
        expect(expectedResult).toHaveLength(2);
      });

      it("should add a WayBill to an array that doesn't contain it", () => {
        const wayBill: IWayBill = sampleWithRequiredData;
        const wayBillCollection: IWayBill[] = [sampleWithPartialData];
        expectedResult = service.addWayBillToCollectionIfMissing(wayBillCollection, wayBill);
        expect(expectedResult).toHaveLength(2);
        expect(expectedResult).toContain(wayBill);
      });

      it('should add only unique WayBill to an array', () => {
        const wayBillArray: IWayBill[] = [sampleWithRequiredData, sampleWithPartialData, sampleWithFullData];
        const wayBillCollection: IWayBill[] = [sampleWithRequiredData];
        expectedResult = service.addWayBillToCollectionIfMissing(wayBillCollection, ...wayBillArray);
        expect(expectedResult).toHaveLength(3);
      });

      it('should accept varargs', () => {
        const wayBill: IWayBill = sampleWithRequiredData;
        const wayBill2: IWayBill = sampleWithPartialData;
        expectedResult = service.addWayBillToCollectionIfMissing([], wayBill, wayBill2);
        expect(expectedResult).toHaveLength(2);
        expect(expectedResult).toContain(wayBill);
        expect(expectedResult).toContain(wayBill2);
      });

      it('should accept null and undefined values', () => {
        const wayBill: IWayBill = sampleWithRequiredData;
        expectedResult = service.addWayBillToCollectionIfMissing([], null, wayBill, undefined);
        expect(expectedResult).toHaveLength(1);
        expect(expectedResult).toContain(wayBill);
      });

      it('should return initial array if no WayBill is added', () => {
        const wayBillCollection: IWayBill[] = [sampleWithRequiredData];
        expectedResult = service.addWayBillToCollectionIfMissing(wayBillCollection, undefined, null);
        expect(expectedResult).toEqual(wayBillCollection);
      });
    });

    describe('compareWayBill', () => {
      it('Should return true if both entities are null', () => {
        const entity1 = null;
        const entity2 = null;

        const compareResult = service.compareWayBill(entity1, entity2);

        expect(compareResult).toEqual(true);
      });

      it('Should return false if one entity is null', () => {
        const entity1 = { id: 27026 };
        const entity2 = null;

        const compareResult1 = service.compareWayBill(entity1, entity2);
        const compareResult2 = service.compareWayBill(entity2, entity1);

        expect(compareResult1).toEqual(false);
        expect(compareResult2).toEqual(false);
      });

      it('Should return false if primaryKey differs', () => {
        const entity1 = { id: 27026 };
        const entity2 = { id: 6454 };

        const compareResult1 = service.compareWayBill(entity1, entity2);
        const compareResult2 = service.compareWayBill(entity2, entity1);

        expect(compareResult1).toEqual(false);
        expect(compareResult2).toEqual(false);
      });

      it('Should return false if primaryKey matches', () => {
        const entity1 = { id: 27026 };
        const entity2 = { id: 27026 };

        const compareResult1 = service.compareWayBill(entity1, entity2);
        const compareResult2 = service.compareWayBill(entity2, entity1);

        expect(compareResult1).toEqual(true);
        expect(compareResult2).toEqual(true);
      });
    });
  });

  afterEach(() => {
    httpMock.verify();
  });
});
