??? question "...if Barni can use Figma"

    **Short answer:** yes. The whole interface was designed in Figma before a line of app code was written, by hand and without AI tools.

    The process went from studying existing map apps, through paper sketches, a type system and a color palette, to a parameterized component library: buttons from primary to quaternary level, small components composed into larger UI elements, and those into full screen prototypes, with a consistent 16 design system, applicable for the web later on.

    Used parameters and prototypes to mock the components and views.

    ![Components, screens and user flows in the Figma workspace](../assets/images/developer-guide/design/final-flows-and-components-excerpt.png){ width="480" }
    /// caption
    A section of the Figma workspace: components build up screens, and screens build up user flows.
    ///

    ![The parameterized confirmation modal component in Figma](../assets/images/developer-guide/design/parameterized-component.png){ width="480" }
    /// caption
    A parameterized component: the button level, title and description of the confirmation modal change from the Figma properties panel.
    ///
    
    **Where to look**

    - [The Figma file]([FIGMA_URL](https://www.figma.com/design/sFTCUcwvNQdkRjdSX7uy2h/Charted?node-id=257-2&t=2rPa36xI73memWaq-1)): the original design, open to view.
    - [UI and UX design](../developer-guide/design/ui-ux.md): from sketches to components, in depth.

    **Why it matters:** designing wire-frames, then design first meant the UX became more coherent, it was easier to write down the design system and by this, to change the design later.  
