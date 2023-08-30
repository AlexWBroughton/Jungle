describe("Product Details", () => {
  it("Navigates to product detail page", () => {
    // Start by visiting the home page
    cy.visit("/");

    // Find the link with an href that matches the pattern /products/:id and click it
    cy.get('a[href^="/products/"]').first().click();

    // Add assertions for the product detail page
    cy.url().should("match", /\/products\/\d+/);

    // Wait for the product details page to load
    cy.wait(1000);

    // Assert that the product detail container is visible
    cy.get(".product-detail").should("be.visible");
  });
});
