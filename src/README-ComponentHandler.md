# `mdlComponentHanlder.js`

This module manages the lifecycle of MDL components, including their registration, initialization (or "upgrading"), and deconstruction (or "downgrading"). It implements a design pattern that meets the requirements you mentioned. Here's how:

1. Registration of New Components: The register or registerInternal function is used to register new components. When a component is registered, its configuration (including its constructor, CSS class, and other properties) is added to the registeredComponents_ array. This array is used to keep track of all registered components.

2. Automatic DOM Upgrades on Document Load: The componentHandler object attaches an event listener to the window's load event. When the window loads, it calls upgradeAllRegistered or upgradeAllRegisteredInternal, which iterates over all registered components and calls upgradeDomInternal for each one. This function searches the DOM for elements that have the CSS class associated with the component and upgrades them to be instances of the component.

3. Handling Upgrades of Elements Added After Initial Page Load: The upgradeElement and upgradeElements functions can be used to upgrade specific elements or collections of elements that are added to the DOM after the initial page load. These functions also use the upgradeElementInternal function, which upgrades a single element to a specific component type.

4. Preventing Double Upgrades: The upgradeElementInternal function checks if an element has already been upgraded to a specific component type before upgrading it. This is done by checking the data-upgraded attribute of the element, which contains a comma-separated list of all the component types the element has been upgraded to. If the element has already been upgraded to the component type, the function returns early, preventing a double upgrade.

5. Allowing Multiple Component Types per Element: The upgradeElementInternal function allows an element to be upgraded to multiple component types. It does this by appending the new component type to the data-upgraded attribute of the element, rather than overwriting it. This means that each element can have multiple component types associated with it, and the behavior of each component type is kept separate and doesn't interfere with the others.

6. Downgrading Components: The downgradeElements function can be used to downgrade specific elements or collections of elements. This is useful for cleaning up components when they are no longer needed, such as when removing elements from the DOM. The downgradeNodesInternal function handles the actual downgrading, which involves removing the component instance from the createdComponents_ array, updating the data-upgraded attribute of the element, and dispatching a mdl-componentdowngraded event.

This design pattern ensures that all elements that should be MDL components are properly upgraded, whether they exist when the page loads or are added later, and that no element is upgraded to the same component more than once. It also allows elements to be upgraded to multiple component types, providing flexibility in component behavior.
