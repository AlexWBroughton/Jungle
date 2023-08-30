describe("Add to Cart", () => {
  const homeUrl = "http://localhost:3000/";

  it("increases cart count when adding a product", () => {
    // Start by visiting the home page
    cy.visit(homeUrl);

    // Get the initial cart count from the link text
    cy.get(".nav-link:contains('My Cart')").invoke("text").then(initialText => {
      const initialCount = Number(initialText.match(/\((\d+)\)/)[1]);

      // Click the 'Add to Cart' button for the first product with { force: true }
      cy.get(".products article:first-child .btn:contains('Add')").click({ force: true });

      // Get the updated cart count from the link text
      cy.get(".nav-link:contains('My Cart')").invoke("text").should(updatedText => {
        const updatedCount = Number(updatedText.match(/\((\d+)\)/)[1]);

        // Compare the initial and updated cart counts
        expect(updatedCount).to.equal(initialCount + 1);
      });
    });
  });
});
