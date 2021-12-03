import { makeStyles } from '@material-ui/styles';
import { colors } from '@material-ui/core';
const useStyles = makeStyles(theme => ({
  root: {
    justifyContent : "left",
  },
  drawer : {
    marginTop: "0px",
    paddingTop : "70px",
    width: "250px",
    backgroundColor: "orange"
  },
  item: {
    display: 'flex',
    paddingTop: 0,
    paddingBottom: 0,
    borderBottom: '2px solid rgba(0, 0, 0, 0.12)'
  },
  button: {
    color: colors.blueGrey[800],
    padding: '10px 8px',
    justifyContent: 'flex-start',
    textTransform: 'none',
    letterSpacing: 0,
    width: '100%',
  },
  btnRoot : {
    paddingLeft : "25px",
    justifyContent : "left !important"
  },
  subMenu : {
    paddingLeft : "50px !important",
  }
}));
export default useStyles;