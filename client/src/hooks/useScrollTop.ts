export default function useScrollTop() {
  const triggerScrollTop = () => {
    try {
      window.scroll({
        top: 0,
        left: 0,
        behavior: 'smooth',
      });
    } catch (error) {
      window.scrollTo(0, 0);
    }
  };

  return { triggerScrollTop };
}
