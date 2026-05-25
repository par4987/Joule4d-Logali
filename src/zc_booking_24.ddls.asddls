@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Semantickey: [ 'BookingID' ]
}
@AccessControl.authorizationCheck: #MANDATORY
define view entity ZC_BOOKING_24
  as projection on ZR_BOOKING_24
  association [1..1] to ZR_BOOKING_24 as _BaseEntity on $projection.UUID = _BaseEntity.UUID
{
  key UUID,
  ParentUUID,
  BookingID,
  BookingDate,
  CustomerID,
  CarrierID,
  ConnectionID,
  FlightDate,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'Currency', 
      Entity.Name: 'I_CurrencyStdVH', 
      Useforvalidation: true
    } ]
  }
  CurrencyCode,
  @Semantics: {
    Amount.Currencycode: 'CurrencyCode'
  }
  FlightPrice,
  @Semantics: {
    Amount.Currencycode: 'CurrencyCode'
  }
  DiscountedFlightPrice,
  _Travel : redirected to parent ZC_TRAVEL_24,
  _BaseEntity
}
