describe("Product Page Content", () => {
  const homeUrl = "http://localhost:3000/";

  it("displays products on the page", () => {
    cy.visit(homeUrl);
    cy.get(".products article").should("be.visible");
  });

  it("displays 12 products on the page", () => {
    cy.visit(homeUrl);
    cy.get(".products article").should("have.length", 12);
  });
});





